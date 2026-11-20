class EventEmitter:
    def __init__(self):
        self.listeners_registry = {}
    
    def on(self, event, listener):
        if event in self.listeners_registry:
            self.listeners_registry[event].append(listener)
        else:
            self.listeners_registry[event] = [listener]
    
    def off(self, event, listener):
        if event in self.listeners_registry:
            if listener in self.listeners_registry[event]:
                self.listeners_registry[event].remove(listener)
    
    def emit(self, event, payload):
        if event in self.listeners_registry:
            return [payload] * len(self.listeners_registry[event])
        return []


def event_broadcaster(op_names: list[str], op_args: list[list]) -> list:
    results = []
    
    for index in range(len(op_names)):
        
        if op_names[index] == "EventEmitter":
            emitter = EventEmitter()
            results.append(None)
        elif op_names[index] == "on":
            emitter.on(*op_args[index])
            results.append(None)
        elif op_names[index] == "off":
            emitter.off(*op_args[index])
            results.append(None)
        elif op_names[index] == "emit":
            results.append(emitter.emit(*op_args[index]))

    return results
