
import socket
import struct
import cdp_packets

class DeviceConnection:
	def __init__(self):
		self.connected = False
		self.ip = None
		self.port = None
		self.socket = None

	def connect(self, ip):
		self.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
		self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
		self.ip = ip
		self.socket.bind(('', self.port))  # use MCAST_GRP instead of '' to listen only to MCAST_GRP, not all groups on MCAST_PORT
		self.socket.settimeout(2) #2 second timeout

	def disconnect(self):
		self.socket.close()

	def send(self, data):
		self.socket.sendto(data, (self.ip, self.port))

	def receive(self):
		try:
			self.socket.recvfrom(4096)
		except:
			return None

class DiscoveryConnection:
	def __init__(self, group, port):
		self.group = group
		self.port = port
		self.socket = None

	def connect(self):
		self.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
		self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
		self.socket.bind(('', self.port))  # use MCAST_GRP instead of '' to listen only to MCAST_GRP, not all groups on MCAST_PORT
		mreq = struct.pack("4sl", socket.inet_aton(self.group), socket.INADDR_ANY)
		self.socket.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
		self.socket.settimeout(2) #2 second timeout

	def disconnect(self):
		self.socket.close()

	def listen(self):
		return self.socket.recvfrom(256)

class CommandHandler:
	def __init__(self, discovery_group, discovery_port, device_unicast_port):
		self.discovery_connection = DiscoveryConnection(discovery_group, discovery_port)
		self.device_connection = DeviceConnection()
		self.device_connection.port = device_unicast_port

	def discover_devices(self):
		self.discovery_connection.connect()
		devices = []
		try:
			data, addr = self.discovery_connection.listen()
			packet = cdp_packets.CdpPacket(data)
			if(packet.valid == True):
				for x in range(0, len(packet.data_items)):
					if(packet.data_items[x].type == cdp_packets.DISCOVERY_TYPE):
						discovery = cdp_packets.CdpDeviceDiscovery(packet.data_items[x].data)
						devices.append("\r\nIP: " + addr[0] + " - Info: " + str(discovery) + "\r\n")
		except:
			pass

		self.discovery_connection.disconnect()
		return devices

	def connect_to_device(self, ip):
		self.device_connection.connect(ip)
		connect_packet = cdp_packets.CdpPacket()
		connect_packet.add_data_item(cdp_packets.CdpConnectCommand())
		
		self.device_connection.send(connect_packet.serialize())

	def send_step_motor_command(self, motor_axis, motor_index, direction, number_steps):
		packet = cdp_packets.CdpPacket()
		packet.add_data_item(cdp_packets.CdpStepMotorCommand(motor_axis, motor_index, direction, number_steps))
		self.device_connection.send(packet.serialize())

	def send_step_axis_command(self, motor_axis, direction, number_steps):
		packet = cdp_packets.CdpPacket()
		packet.add_data_item(cdp_packets.CdpStepAxisCommand(motor_axis, direction, number_steps))
		self.device_connection.send(packet.serialize())

	def send_set_location_command(self, x, y, z):
		packet = cdp_packets.CdpPacket()
		packet.add_data_item(cdp_packets.CdpSetLocationCommand(x, y, z))
		self.device_connection.send(packet.serialize())

	def send_set_origin_command(self):
		packet = cdp_packets.CdpPacket()
		packet.add_data_item(cdp_packets.CdpSetOriginCommand())
		self.device_connection.send(packet.serialize())

	def send_vector_move_command(self, period_x, steps_x, period_y, steps_y, period_z, steps_z):
		packet = cdp_packets.CdpPacket()
		packet.add_data_item(cdp_packets.CdpVectorMoveCommand(period_x, steps_x, period_y, steps_y, period_z, steps_z))
		self.device_connection.send(packet.serialize())