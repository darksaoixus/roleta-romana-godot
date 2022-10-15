using Godot;
using System;

public class List : Reference
{
    private LElement _inicio, _fim;
    private int _tamanho;

    [Signal]
    delegate void RemovedElement(String nome);

    public void Insere(String nome)
    {
        LElement elementoAInserir = new LElement(nome);
        
        if (_tamanho == 0)
        {
            _inicio = elementoAInserir;
            _fim = elementoAInserir;
            elementoAInserir.Anterior = elementoAInserir;
            elementoAInserir.Prox = elementoAInserir;
        }
        else if (_tamanho == 1)
        {
            elementoAInserir.Anterior = _fim;
            elementoAInserir.Prox = _inicio;
            _fim = elementoAInserir;
            _inicio.Anterior = elementoAInserir;
            _inicio.Prox = elementoAInserir;
        }
        else
        {
            elementoAInserir.Anterior = _fim;
            elementoAInserir.Prox = _inicio;
            _fim.Prox = elementoAInserir;
            _inicio.Anterior = elementoAInserir;
        }
        _tamanho++;
    }

    public void Remove(LElement elemento)
    {
        EmitSignal(nameof(RemovedElement), elemento.Nome);

        if (elemento == _inicio)
        {
            _inicio = _inicio.Prox;
        }
        else if (elemento == _fim)
        {
            _fim = _fim.Anterior;
        }

        elemento.Anterior.Prox = elemento.Prox;
        elemento.Prox.Anterior = elemento.Anterior;

        _tamanho--;
    }

    public void Roleta(int n)
    {
        while (_tamanho != 1)
        {
            LElement el = _inicio;

            for (int i = 0; i < n; i++)
            {
                el = el.Prox;
            }

            Remove(el);
        }
    }

    public void MostraElementos()
    {
        LElement el = _inicio;

        for (int i = 0; i < _tamanho; i++)
        {
            GD.Print(el.Nome);
            el = el.Prox;
        }
    }
}
