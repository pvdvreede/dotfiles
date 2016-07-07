import os, subprocess, dotbot

class MyPlugin(dotbot.Plugin):
    _directive = "NOTIMPLEMENTED"

    def can_handle(self, directive):
        self._log.info(directive)
        self._log.info(self._directive)
        return directive == self._directive

    def _check_directive(self, directive):
        if directive != self._directive:
            raise ValueError('%s cannot handle directive %s' % (self.__class__.__name__, directive))

    def handle(self, directive, data):
        self._check_directive(directive)
        defaults = self._context.defaults().get(self._directive, {})
        return self._process(data, defaults)

    def _run_shell(self, cmd):
        process = subprocess.Popen(cmd, shell=True,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.STDOUT)
        out = process.stdout.read()
        process.stdout.close()

class AptSource(MyPlugin):

    def __init__(self, context):
        super(AptGet, self).__init__(self)
        self._context = context
        self._directive = 'aptsource'

    def _process(self, sources, defaults):
        results = {}
        for name, source in sources.iteritems():
            self._log.info('Adding apt source for %s...' % name)
            self._run_shell('sudo su -c "echo %s > /etc/apt/sources.list.d/%s.list"' % (source, name))
        return True

