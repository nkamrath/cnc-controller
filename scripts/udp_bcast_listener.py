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
import struct

MCAST_GRP = '224.1.1.1'
MCAST_PORT = 50009

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind(('', MCAST_PORT))  # use MCAST_GRP instead of '' to listen only
                             # to MCAST_GRP, not all groups on MCAST_PORT
mreq = struct.pack("4sl", socket.inet_aton(MCAST_GRP), socket.INADDR_ANY)

sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)

while True:
	data, addr = sock.recvfrom(1024)
	print addr, " : ", data