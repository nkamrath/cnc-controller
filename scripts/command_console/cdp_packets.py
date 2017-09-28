import struct

CDP_MARK = 0xCD01
CDP_HEADER_SIZE = 4
CDP_DATA_ITEM_HEADER_SIZE = 4

class CdpDataItem:
	def __init__(self):
		self.type = 0
		self.length = 0
		self.data = []

	def process(self, data):
		self.type, self.length = struct.unpack("<HH", data[:4])
		self.data = data[CDP_DATA_ITEM_HEADER_SIZE:CDP_DATA_ITEM_HEADER_SIZE+self.length]
		#lenght is only the length of the payload, so include the data item header in processed count
		return self.length + CDP_DATA_ITEM_HEADER_SIZE

class CdpPacket:
	def __init__(self, data):
		self.valid = False
		self.data = []
		self.data_items = []
		if(len(data) > 3):
			self.mark, = struct.unpack("<L", data[:4])
			if(self.mark == CDP_MARK):
				self.valid = True
				self.data = data[4:]
				payload_length = len(data) - CDP_HEADER_SIZE
				bytes_processed = 0
				while bytes_processed < payload_length:
					data_item = CdpDataItem()
					bytes_processed += data_item.process(self.data[bytes_processed:])
					self.data_items.append(data_item)

DISCOVERY_LENGTH = 4
DISCOVERY_TYPE = 0x0001
class DeviceDiscovery:
	def __init__(self, data):
		if(len(data) == DISCOVERY_LENGTH):
			self.firmware_major, self.firmware_minor, self.firmware_patch, self.device_status = struct.unpack("<BBBB", data)

	def __str__(self):
		ret = "Version: " + str(self.firmware_major) + "." + str(self.firmware_minor) + "." + str(self.firmware_patch) + ", "
		ret += "Status: " + str(self.device_status)
		return ret