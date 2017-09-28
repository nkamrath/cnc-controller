#udp broadcast listener

"""
from socket import *
s=socket(AF_INET, SOCK_DGRAM)
s.bind(('0.0.0.0',54321))
m=s.recvfrom(1024)
print m[0]
"""
import socket
import struct

IP = "192.168.0.24"
PORT = 50010

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
sock.bind (('', 50011))

while True:
	input_var = raw_input("Enter Message: ")
	sock.sendto(input_var, (IP, PORT))
	data, addr = sock.recvfrom(1024)
	print addr, " : ", data