# app/hyperstack/component/app.rb

# This is your top level component, the rails router will
# direct all requests to mount this component.  You may
# then use the Route psuedo component to mount specific
# subcomponents depending on the URL.

class App < HyperComponent
  include Hyperstack::Router

  # define routes using the Route psuedo component.  Examples:
  # Route('/foo', mounts: Foo)                : match the path beginning with /foo and mount component Foo here
  # Route('/foo') { Foo(...) }                : display the contents of the block
  # Route('/', exact: true, mounts: Home)     : match the exact path / and mount the Home component
  # Route('/user/:id/name', mounts: UserName) : path segments beginning with a colon will be captured in the match param
  # see the hyper-router gem documentation for more details

  #@left = Array.new(10) { rand(10..90) }
  #@delay = Array.new(10) { rand(1..9) }

  before_mount do

    Move.on_dispatch do|params|
      mutate @id = params.id
      mutate @score += 1
      jQ["##{@id}"].addClass( "hide" );
    end

    Start.on_dispatch do |params|
      mutate @st = params.st
    end

    @left = [10,20,33,45,56,67,71,77,80,90]
    @delay = [1,3.7,2.1,4,5,4.6,2.8,7.1,3.9,1.8]
    @st = 0
    @score = 0

  end

  render(DIV) do

    BUTTON(class: "start") do
      "Start"
    end.on(:click) do
      Start.run(st: 1)
    end

    DIV(class: "score") do
      "Your score: #{@score}"
    end

    if @st == 1
      10.times do |x|
        DIV(class: "move1", id: x, style: {"left" => "#{@left[x]}vw", "animation-delay" => "#{@delay[x]}s"}) do
          ""
        end.on(:click) do
          Move.run(id: x)
        end
      end
    end
  end

end