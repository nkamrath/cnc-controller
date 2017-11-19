import struct

CDP_MARK = 0xCD01
CDP_HEADER_SIZE = 4
CDP_DATA_ITEM_HEADER_SIZE = 4

class CdpDataItem:
	def __init__(self):
		self.type = 0
		self.length = 0
		self.data = []

	def deserialize(self, data):
		self.type, self.length = struct.unpack("<HH", data[:4])
		self.data = data[CDP_DATA_ITEM_HEADER_SIZE:CDP_DATA_ITEM_HEADER_SIZE+self.length]
		#lenght is only the length of the payload, so include the data item header in processed count
		return self.length + CDP_DATA_ITEM_HEADER_SIZE

class CdpPacket:
	def __init__(self, data = None):
		self.valid = False
		self.data = []
		self.data_items = []
		if(data != None and len(data) > 3):
			self.mark, = struct.unpack("<L", data[:4])
			if(self.mark == CDP_MARK):
				self.valid = True
				self.data = data[4:]
				payload_length = len(data) - CDP_HEADER_SIZE
				bytes_processed = 0
				while bytes_processed < payload_length:
					data_item = CdpDataItem()
					bytes_processed += data_item.deserialize(self.data[bytes_processed:])
					self.data_items.append(data_item)

	def serialize(self):
		serialized = struct.pack("<L", CDP_MARK)
		for x in range(0, len(self.data_items)):
			serialized += struct.pack("<HH", self.data_items[x].type, self.data_items[x].length)
			serialized += self.data_items[x].serialize()

		return serialized

	def add_data_item(self, data_item):
		self.data_items.append(data_item)


class CdpData:
	def __init__(self):
		self.type = 0
		self.length = 0

	def serialize(self):
		return ""

	def deserialze(self, data):
		return

"""
====================================
DISCOVERY
====================================
"""
DISCOVERY_LENGTH = 4
DISCOVERY_TYPE = 0x0001
class CdpDeviceDiscovery(CdpData):
	def __init__(self, data):
		self.type = DISCOVERY_TYPE
		self.length = DISCOVERY_LENGTH
		if(len(data) == DISCOVERY_LENGTH):
			self.firmware_major, self.firmware_minor, self.firmware_patch, self.device_status = struct.unpack("<BBBB", data)

	def __str__(self):
		ret = "Version: " + str(self.firmware_major) + "." + str(self.firmware_minor) + "." + str(self.firmware_patch) + ", "
		ret += "Status: " + str(self.device_status)
		return ret

"""
====================================
CONNECT COMMAND
====================================
"""
CONNECT_COMMAND_LENGTH = 6
CONNECT_COMMAND_TYPE = 0x0002
class CdpConnectCommand(CdpData):
	def __init__(self):
		self.type = CONNECT_COMMAND_TYPE
		self.length = CONNECT_COMMAND_LENGTH
		self.ip_address = 0
		self.port = 0
	def serialize(self):
		return struct.pack("<LH", self.ip_address, self.port)

	def deserialize(self, data):
		return

"""
====================================
ACKNOWLEDGE
====================================
"""
ACKNOWLEDGE_LENGTH = 2
ACKNOWLEDGE_TYPE = 0x0003

class CdpAcknowledge(CdpData):
	def __init__(self):
		self.type = ACKNOWLEDGE_TYPE
		self.length = ACKNOWLEDGE_LENGTH
		self.acknowledge_of_type = 0
	def serialize(self):
		return struct.pack("<H", self.acknowledge_of_type)

	def deserialize(self, data):
		self.acknowledge_of_type = struct.unpack("<H", data)

"""
====================================
STEP MOTOR COMMAND
====================================
"""
STEP_MOTOR_LENGTH = 7
STEP_MOTOR_TYPE = 0x0004

class CdpStepMotorCommand(CdpData):
	def __init__(self, motor_axis = 0, motor_index = 0, direction = 0, number_steps = 0):
		self.type = STEP_MOTOR_TYPE
		self.length = STEP_MOTOR_LENGTH
		self.motor_axis = motor_axis
		self.motor_index = motor_index
		self.direction = direction
		self.number_steps = number_steps

	def serialize(self):
		return struct.pack("<BBBL", self.motor_axis, self.motor_index, self.direction, self.number_steps)

	def deserialize(self, data):
		self.motor_axis, self.motor_index, self.direction, self.number_steps = struct.unpack("<BBBL", data)

"""
====================================
STEP AXIS COMMAND
====================================
"""
STEP_AXIS_LENGTH = 6
STEP_AXIS_TYPE = 0x0005

class CdpStepAxisCommand(CdpData):
	def __init__(self, motor_axis = 0, direction = 0, number_steps = 0):
		self.type = STEP_AXIS_TYPE
		self.length = STEP_AXIS_LENGTH
		self.motor_axis = motor_axis
		self.direction = direction
		self.number_steps = number_steps

	def serialize(self):
		return struct.pack("<BBL", self.motor_axis, self.direction, self.number_steps)

	def deserialize(self, data):
		self.motor_axis, self.direction, self.number_steps = struct.unpack("<BBL", data)

"""
====================================
SET STAGE LOCATION COMMAND
====================================
"""
SET_LOCATION_LENGTH = 24
SET_LOCATION_TYPE = 0x0006

class CdpSetLocationCommand(CdpData):
	def __init__(self, x = 0, y = 0, z = 0):
		self.type = SET_LOCATION_TYPE
		self.length = SET_LOCATION_LENGTH
		self.x = x
		self.y = y
		self.z = z

	def serialize(self):
		return struct.pack("<ddd", self.x, self.y, self. z)

	def deserialize(self, data):
		self.x, self.y, self.z = struct.unpack("<ddd", data)

"""
====================================
SET STAGE ORIGIN
====================================
"""
SET_ORIGIN_LENGTH = 0 #no payload
SET_ORIGIN_TYPE = 0x0007

class CdpSetOriginCommand(CdpData):
	def __init__(self, x = 0, y = 0, z = 0):
		self.type = SET_ORIGIN_TYPE
		self.length = SET_ORIGIN_LENGTH

	def serialize(self):
		return ""

	def deserialize(self, data):
		return

"""
====================================
VECTOR MOVE
====================================
"""
VECTOR_MOVE_LENGTH = 24 #no payload
VECTOR_MOVE_TYPE = 0x0008

class CdpVectorMoveCommand(CdpData):
	def __init__(self, period_x, steps_x, period_y, steps_y, period_z, steps_z):
		self.type = VECTOR_MOVE_TYPE
		self.length = VECTOR_MOVE_LENGTH
		self.period_x = period_x
		self.steps_x = steps_x
		self.period_y = period_y
		self.steps_y = steps_y
		self.period_z = period_z
		self.steps_z = steps_z

	def serialize(self):
		return struct.pack("<IiIiIi", self.period_x, self.steps_x, self.period_y, self.steps_y, self.period_z, self.steps_z)

	def deserialize(self, data):
		self.period_x, self.steps_x, self.period_y, self.steps_y, self.period_z, self.steps_z = struct,unpack("<IiIiIi, data")