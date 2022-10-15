using System;

public class LElement
{
    private String _name;

    public String Name { get { return _name; } }
    public LElement Next;

    public LElement(String name)
    {
        _name = name;
    }
}
