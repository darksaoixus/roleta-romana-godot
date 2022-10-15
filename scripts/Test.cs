using Godot;
using System;

public class Test : Node
{
    private List _list = new List();

    public override void _Ready()
    {
        _list.Connect("RemovedElement", this, nameof(OnListRemovedElement));
        _list.Insere("jorge");
        _list.Insere("paulao");
        _list.Insere("cleiton");
        _list.MostraElementos();
        _list.Roleta(2);
        _list.MostraElementos();
    }

    public void OnListRemovedElement(String name)
    {
        GD.Print("Removeu " + name);
    }
}
