
import socket
import struct
import cdp_packets

class CommandHandler:
	def __init__(self, discovery_group, discovery_port):
		self.discovery_group = discovery_group
		self.discovery_port = discovery_port
		self.discovery_socket = None

	def discovery_socket_create(self):
		self.discovery_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
		self.discovery_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
		self.discovery_socket.bind(('', self.discovery_port))  # use MCAST_GRP instead of '' to listen only
		                             # to MCAST_GRP, not all groups on MCAST_PORT
		mreq = struct.pack("4sl", socket.inet_aton(self.discovery_group), socket.INADDR_ANY)
		self.discovery_socket.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
		self.discovery_socket.settimeout(2) #2 second timeout

	def discovery_socket_destroy(self):
		self.discovery_socket.close()

	def discover_devices(self):
		self.discovery_socket_create()
		devices = []
		try:
			data, addr = self.discovery_socket.recvfrom(256)
			packet = cdp_packets.CdpPacket(data)
			if(packet.valid == True):
				for x in range(0, len(packet.data_items)):
					if(packet.data_items[x].type == cdp_packets.DISCOVERY_TYPE):
						discovery = cdp_packets.DeviceDiscovery(packet.data_items[x].data)
						devices.append("\r\nIP: " + addr[0] + " - Info: " + str(discovery) + "\r\n")
		except:
			pass

		self.discovery_socket_destroy()
		return devices