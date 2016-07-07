defmodule Sequence.Server do
  use GenServer

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end
  def handle_call({:set_number, new_number}, _from, _current) do
    {:reply, new_number, new_number}
  end

  # Exercise 1
  def handle_call({:init_stack, contents}, _from, _current) do
    {:reply, contents, contents}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail }
  end
end
