import cmd, sys
import colorama
import command_handler

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

    def do_search(self, line):
        devices = self.command_handler.discover_devices()
        if len(devices) == 0:
            self.print_warning("No devices found!")
        else:
            self.print_success("Found devices:")
            for x in range(0, len(devices)):
                self.print_info(str(devices[x]))

    def do_exit(self, line):
        return True

    def do_EOF(self, line):
        return True

if __name__ == '__main__':
    colorama.init()
    Console().cmdloop()