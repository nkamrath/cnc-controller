import os
import numpy as np
from PIL import Image
import command_handler

BITMAP = ["1111111111", "1000000001", "1000000001", "1000000001", "1000000001", "1000000001", "1000000001", "1000000001", "1000000001", "1111111111"]
BITMAP2 = ["1111111111", "1000000000", "1000000000", "1000000000", "1000000000", "1000000000", "1000000000", "1000000000", "1000000000", "1111111111"]

DIRECTION_UP = 0
DIRECTION_RIGHT = 1
DIRECTION_DOWN = 2
DIRECTION_LEFT = 3

def get_opposite_direction(direction):
	return (direction + 2) % 4

class Bitmap:
	def __init__(self, points):
		self.points = list(points)
		self.width = len(points)
		self.height = len(points[0])

	def get_point(self, point):
		return self.points[point.x][point.y]

	def clear_point(self, point):
		if(self.get_point(point) == '1'):
			if(point.y == 0):
				self.points[point.x] = "0" + self.points[point.x][1:]
			elif(point.y == self.width-1):
				self.points[point.x] = self.points[point.x][:point.y] + "0"
			else:
				self.points[point.x] = self.points[point.x][:point.y] + "0" + self.points[point.x][point.y+1:]

	def mark_vector_start(self, point):
		if(point.y == 0):
			self.points[point.x] = "2" + self.points[point.x][1:]
		elif(point.y == self.width-1):
			self.points[point.x] = self.points[point.x][:point.y] + "2"
		else:
			self.points[point.x] = self.points[point.x][:point.y] + "2" + self.points[point.x][point.y+1:]

	def get_set_bit(self):
		for x in range(0, len(self.points)):
			for y in range(0, len(self.points)):
				if(self.points[x][y] == '1'):
					return Point3(x, y, 0)
		return None

class Point2:
	def __init__(self, x=0, y=0):
		self.x = x
		self.y = y

class Point3:
	def __init__(self, x=0, y=0, z=0):
		self.x = x
		self.y = y
		self.z = z

	def copy(self):
		return Point3(self.x, self.y, self.z)

	def equals(self, other):
		if(self.x == other.x and self.y == other.y and self.z == other.z):
			return True
		return False

	def __str__(self):
		return "(" + str(self.x) + ", " + str(self.y) + ", " + str(self.z) + ")"

def move_point_direction(point, direction, bitmap):
	if(direction == DIRECTION_LEFT and point.x > 0):
		return Point3(point.x-1, point.y, point.z)
	elif(direction == DIRECTION_RIGHT and point.x < bitmap.width-1):
		return Point3(point.x+1, point.y, point.z)
	elif(direction == DIRECTION_UP and point.y < bitmap.height-1):
		return Point3(point.x, point.y+1, point.z)
	elif(direction == DIRECTION_DOWN and point.y > 0):
		return Point3(point.x, point.y-1, point.z)
	else:
		return None

def extend_vector_start(point, direction, bitmap):
	#get the opposite direction and look backwards for vector start points that are immediate neighbors, extend until a '0' is hit
	print "Point: ", str(point)
	opposite_direction = get_opposite_direction(direction)
	temp_point = move_point_direction(point.copy(), opposite_direction, bitmap)
	print "Temp piont: ", str(temp_point)
	if(temp_point != None):
		print bitmap.get_point(temp_point.copy())
	if(temp_point != None and bitmap.get_point(temp_point.copy()) != "0"):
		print "return temp point"
		return temp_point
	else:
		return point


def trace_vector(start_point, remaining_bitmap):
	if(start_point.x > 0 and remaining_bitmap.get_point(Point2(start_point.x-1, start_point.y)) == '1'):
		start_point = extend_vector_start(start_point, DIRECTION_LEFT, remaining_bitmap)
		#find end of vector from start_point in the negative x direction parallel to the y axis
		next_x = start_point.x - 1
		while(next_x >= 0 and remaining_bitmap.get_point(Point2(next_x, start_point.y)) != '0'):
			remaining_bitmap.clear_point(Point2(next_x, start_point.y))
			next_x -= 1
		#we have found the end of the vector
		return start_point.copy(), Point3(next_x + 1, start_point.y, start_point.z)

	elif(start_point.x < remaining_bitmap.width-1 and remaining_bitmap.get_point(Point2(start_point.x+1, start_point.y)) == '1'):
		start_point = extend_vector_start(start_point, DIRECTION_RIGHT, remaining_bitmap)
		#find end of vector from start_point in the positive x direction parallel to the y axis
		next_x = start_point.x + 1
		while(next_x < remaining_bitmap.width and remaining_bitmap.get_point(Point2(next_x, start_point.y)) != '0'):
			remaining_bitmap.clear_point(Point2(next_x, start_point.y))
			next_x += 1
		#we have found the end of the vector
		return start_point.copy(), Point3(next_x - 1, start_point.y, start_point.z)

	elif(start_point.y > 0 and remaining_bitmap.get_point(Point2(start_point.x, start_point.y-1)) == '1'):
		start_point = extend_vector_start(start_point, DIRECTION_DOWN, remaining_bitmap)
		#find end of vector from start_point in the negative y direction parallel to the x axis
		next_y = start_point.y - 1
		while(next_y >= 0 and remaining_bitmap.get_point(Point2(start_point.x, next_y)) != '0'):
			remaining_bitmap.clear_point(Point2(start_point.x, next_y))
			next_y -= 1
		#we have found the end of the vector
		return start_point.copy(), Point3(start_point.x, next_y+1, start_point.z)

	elif(start_point.y < remaining_bitmap.height-1 and remaining_bitmap.get_point(Point2(start_point.x, start_point.y+1)) == '1'):
		start_point = extend_vector_start(start_point, DIRECTION_UP, remaining_bitmap)
		#find end of vector from start_point in the positive y direction parallel to the x axis
		next_y = start_point.y + 1
		while(next_y < remaining_bitmap.height and remaining_bitmap.get_point(Point2(start_point.x, next_y)) != '0'):
			remaining_bitmap.clear_point(Point2(start_point.x, next_y))
			next_y += 1
		#we have found the end of the vector
		return start_point.copy(), Point3(start_point.x, next_y-1, start_point.z)
	return start_point, None

def gen_path(current_location, z_offset, remaining_bitmap):
	locations = []

	remaining_location = remaining_bitmap.get_set_bit()
	remaining_bitmap.clear_point(remaining_location)
	while(remaining_location != None):

		#find the start and end of any vector attached to this point
		vector_start, vector_end = trace_vector(remaining_location, remaining_bitmap)
		locations.append(vector_start.copy())
		remaining_bitmap.mark_vector_start(vector_start.copy())
		#lower
		vector_start_lower = vector_start.copy()
		vector_start_lower.z = -z_offset
		remaining_bitmap.mark_vector_start(vector_start)
		locations.append(vector_start_lower.copy())
		
		if(vector_end != None):
			vector_end.z = -z_offset

			last_end = vector_end
			while(vector_end != None and not vector_end.equals(vector_start)):
				last_end = vector_end
				locations.append(vector_end.copy())
				remaining_bitmap.mark_vector_start(vector_end)
				vector_start, vector_end = trace_vector(vector_end, remaining_bitmap)
				if(vector_end != None):
					print "start: " + str(vector_start)
					print "end: " + str(vector_end)

			if(last_end != None):
				last_end.z = 0
				locations.append(last_end.copy())
		else:
			locations.append(vector_start.copy())

		remaining_location = remaining_bitmap.get_set_bit()
	return locations

def load_cnc_file(file_name, z_offset):
	locations = [Point3(0, 0, 0)] #start at origin
	#open the file
	with open(file_name, 'r') as f:
		data = f.readlines()

	#each line is [x, y]\r\n
	for line in data:
		temp = line.replace(' ', '').replace('\r', '').replace('\n', '').replace('[', '').replace(']', '')
		point = temp.split(',')
		locations.append(Point3(float(point[0]), float(point[1]), 0))
		locations.append(Point3(float(point[0]), float(point[1]), -z_offset))
		locations.append(Point3(float(point[0]), float(point[1]), 0))

	return locations




def loadImage(fileName):
	img = Image.open(fileName)
	print img.size
	print img.mode
	try: #image doesnt have alpha channel
		img2 = np.array(img.getdata(),np.uint8)#.reshape(img.size[1],img.size[0],3)
	except: #image has alpha channel
		img2 = np.array(img.getdata(),np.uint8).reshape(img.size[1],img.size[0],4)
	
	print len(img2)

	img_array = []
	for x in range(0, img.size[1]):
		row = ""
		for y in range(0, img.size[0]):
			if(img2[((x*(img.size[1])) + y)] == 0):
				row += "1"
			else:
				row += "0"
		img_array.append(row)

	return img_array

def scale_locations(locations, amount):
	new_locations = []
	for location in locations:
		new_point = location.copy()
		new_point.x = new_point.x*float(amount)
		new_point.y = new_point.y*float(amount)
		#don't need to scale z as it is an offset input by the command parameters at the command line
		#not gathered from the 2d drawing
		#new_point.z = new_point.z*float(amount)
		new_locations.append(new_point.copy())

	return new_locations

#z offset is the height above the plane to interact with
def print_bitmap(command_handler, z_offset, file_name):
	#bitmap = Bitmap(BITMAP)
	bitmap = Bitmap(loadImage(file_name))

	print "bmp width: ", len(bitmap.points)

	locations = gen_path(Point3(0, 0, 0), z_offset, bitmap)
	locations.append(Point3(0, 0, 0)) #add a move back to origin at the end

	#drawings are in .1 mm scale, so we need to scale the locations generated from pixels to units of .1 mm per pixel
	scaled_locations = scale_locations(locations, 0.1)
	for location in scaled_locations:
		print str(location)
		command_handler.send_set_location_command(location.x, location.y, location.z)

#z offset is the height above the plane to interact with
def print_cnc_file(command_handler, z_offset, file_name):

	locations = load_cnc_file(file_name, z_offset)
	locations = scale_locations(locations, 0.1)
	for location in locations:
		print str(location)
		command_handler.send_set_location_command(location.x, location.y, location.z)

