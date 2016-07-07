defmodule Sequence.Server do
  use GenServer

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end

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

  def handle_cast({:push, new_val}, list) do
    {:noreply, [new_val | list]}
  end

  def handle_cast({:increment_number, delta}, current) do
    {:noreply, current + delta}
  end
end
