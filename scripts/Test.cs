using Godot;
using System;

public class Test : Node
{
    private List _list = new List();

    public override void _Ready()
    {
        _list.Connect("RemovedElement", this, nameof(OnListRemovedElement));
        _list.Append("jorge");
        _list.Append("paulo");
        _list.Append("cleiton");
        _list.Append("rafael");
        _list.Remove(2);
    }

    public void OnListRemovedElement(String name)
    {
        GD.Print(name);
    }
}
