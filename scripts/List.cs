using Godot;
using System;

public class List : Reference
{
    private LElement _head = null;
    private int _size;

    [Signal]
    delegate void RemovedElement(String name);

    public void Append(String name)
    {
        LElement elementToAppend = new LElement(name);
        if (_head == null)
            _head = elementToAppend;
        else
        {
            LElement el = _head;
            while (el.Next != _head)
            {
                el = el.Next;
            }
            el.Next = elementToAppend;
            elementToAppend.Next = _head;
        }
        _size++;
    }

    public void Remove(int n)
    {
        while (_size != 1)
        {
            LElement el = _head;
            LElement previous = null;
            for (int i = 0; i < n; i++)
            {
                previous = el;
                el = el.Next;
            }
            previous.Next = el.Next;
            EmitSignal(nameof(RemovedElement), el.Name);
        }
    }
}
