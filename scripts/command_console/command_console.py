import cmd, sys
import colorama
import command_handler

DISCOVERY_MULTICAST_ADDRESS = "224.1.1.1"
DISCOVERY_MULTICAST_PORT = 50009

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
        self.command_handler = command_handler.CommandHandler(DISCOVERY_MULTICAST_ADDRESS, DISCOVERY_MULTICAST_PORT)

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
        if(':' in line and line.count('.') == 3):
            ip = line.split(':')[0]
            port = line.split(':')[1]
            if(len(port) > 0):
                self.print_success("connecting to " + ip + ":" + port)
            else:
                self.print_error("Bad args, see command help for more information.")

        else:
            self.print_error("Bad args, see command help for more information.")

    def do_greet(self, line):
        self.printc(self.success_color, "hello")

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