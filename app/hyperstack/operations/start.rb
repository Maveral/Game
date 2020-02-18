class Start < Hyperstack::ControllerOp

  # ControllerOp is the most basic kind of remote runnable

  # Operation.  It will execute on the server, but can be invoked from the client

  # All security checking is expected to be done by the

  # operation itself.  (ServerOps provide integrated error checking...)

  # In our initial implementation Move does nothing but rebroadcast its

  # input across the application

  param :st

  dispatch_to Hyperstack::Application # channel to dispatch to

end