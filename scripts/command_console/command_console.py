import cmd, sys
import colorama
import command_handler
import printer

DISCOVERY_MULTICAST_ADDRESS = "224.1.1.1"
DISCOVERY_MULTICAST_PORT = 50009
DEVICE_UNICAST_PORT = 50010

class Console(cmd.Cmd):
    """Simple command processor example."""

    prompt = "> "

    def __init__(self):
        cmd.Cmd.__init__(self)
        self.normal_color = colorama.Fore.WHITE
        self.success_color = colorama.Fore.GREEN
        self.status_color = colorama.Fore.BLUE
        self.error_color = colorama.Fore.RED
        self.warning_color = colorama.Fore.YELLOW
        self.info_color = colorama.Fore.YELLOW
        self.command_handler = command_handler.CommandHandler(DISCOVERY_MULTICAST_ADDRESS, DISCOVERY_MULTICAST_PORT, DEVICE_UNICAST_PORT)

    def printc(self, color, text):
        print(color + text + self.normal_color)

    def print_error(self, text):
        self.printc(self.error_color, "ERROR: " + text)

    def print_success(self, text):
        self.printc(self.success_color, text)

    def print_warning(self, text):
        self.printc(self.warning_color, text)

    def print_info(self, text):
        self.printc(self.info_color, text)

    def do_connect(self, line):
        'USAGE: \"connect IP:PORT\" connect to a device on the specified ip and port.'
        if(line.count('.') == 3):
            ip = line
            
            self.command_handler.connect_to_device(ip)
            self.print_success("connecting to " + ip)

        else:
            self.print_error("Bad args, see command help for more information.")

    def do_step_motor(self, line):
        #parse args
        args = line.lower().split(' ')
        axis = -1
        motor_index = -1
        direction = -1
        step_count = -1
        
        if(args[0] == 'x'):
            axis = 0
        elif(args[0] == 'y'):
            axis = 1
        elif(args[0] == 'z'):
            axis = 2

        motor_index = int(args[1])
        direction = int(args[2])
        step_count = int(args[3])

        self.command_handler.send_step_motor_command(axis, motor_index, direction, step_count)

    def do_step_axis(self, line):
        #parse args
        args = line.lower().split(' ')
        axis = -1
        direction = -1
        step_count = -1
        
        if(args[0] == 'x'):
            axis = 0
        elif(args[0] == 'y'):
            axis = 1
        elif(args[0] == 'z'):
            axis = 2

        direction = int(args[1])
        step_count = int(args[2])

        self.command_handler.send_step_axis_command(axis, direction, step_count)

    def do_set_location(self, line):
        #parse args
        #args should be "x y z" in doubles
        args = line.lower().split(' ')
        x = float(args[0])
        y = float(args[1])
        z = float(args[2])
        self.command_handler.send_set_location_command(x, y, z)

    def do_print(self, line):
        args = line.lower().split(' ')
        filename = args[1]
        extension = filename.split('.')[-1]
        if(extension == 'bmp'):
            printer.print_bitmap(self.command_handler, float(args[0]), args[1])
        elif(extension == 'cnc'):
            printer.print_cnc_file(self.command_handler, float(args[0]), args[1])
        else:
            print "invalid file extension " + extension 

    def do_search(self, line):
        devices = self.command_handler.discover_devices()
        if len(devices) == 0:
            self.print_warning("No devices found!")
        else:
            self.print_success("Found devices:")
            for x in range(0, len(devices)):
                self.print_info(str(devices[x]))

    def do_set_origin(self, line):
        self.command_handler.send_set_origin_command()

    def do_vector_move(self, line):
        args = line.lower().split(' ')
        period_x = int(args[0])
        steps_x = int(args[1])
        period_y = int(args[2])
        steps_y = int(args[3])
        period_z = int(args[4])
        steps_z = int(args[5])
        
        self.command_handler.send_vector_move_command(period_x, steps_x, period_y, steps_y, period_z, steps_z)

    def do_exit(self, line):
        return True

    def do_EOF(self, line):
        return True

if __name__ == '__main__':
    colorama.init()
    Console().cmdloop()