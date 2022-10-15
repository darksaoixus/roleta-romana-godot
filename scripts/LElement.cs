using System;

public class LElement
{
    private String _nome;

    public String Nome { get { return _nome; } }
    public LElement Anterior, Prox;

    public LElement(String nome)
    {
        _nome = nome;
    }
}
