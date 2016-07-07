defmodule Sequence.Stack do
  use GenServer

  ####
  # External API
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init_stack(contents) do
    GenServer.call(__MODULE__, {:init_stack, contents})
  end

  def push(new_val) do
    GenServer.cast(__MODULE__, {:push, new_val})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  ####
  # GenServer implementation
  def handle_call({:init_stack, contents}, _from, _current) do
    {:reply, contents, contents}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail }
  end

  def handle_cast({:push, new_val}, list) do
    {:noreply, [new_val | list]}
  end

  def terminate(reason, state) do
    IO.puts "TERMINATED with reason '#{reason}' and state #{inspect state}"
  end
end
