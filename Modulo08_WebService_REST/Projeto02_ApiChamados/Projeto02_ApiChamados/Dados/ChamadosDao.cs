using Projeto02_ApiChamados.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Projeto02_ApiChamados.Dados
{
    public class ChamadosDao
    {
       
        public IEnumerable<Chamado> BuscarChamados()
        {
            using(var context = new ChamadosContext())
            {
                return context.Chamados.ToList();
            }
        }

        public bool IncluirChamado(Chamado chamado)
        {
            using(var context = new ChamadosContext())
            {
                try
                {
                    chamado.Data = DateTime.Now;
                    chamado.Resolvido = 0;

                    context.Chamados.Add(chamado);
                    context.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public bool RemoverChamado(int id)
        {
            using(var context = new ChamadosContext())
            {
                try
                {
                    var chamado = context
                        .Chamados
                        .FirstOrDefault(p => p.ChamadoId == id);
                    if(chamado.Resolvido == 1)
                    {
                        throw new Exception();
                    }
                    context.Entry<Chamado>(chamado).State = EntityState.Deleted;
                    context.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public bool AlterarChamado(Chamado chamado)
        {
            using(var context = new ChamadosContext())
            {
                try
                {
                    chamado.Resolvido = 1;
                    context.Entry<Chamado>(chamado).State = 
                        EntityState.Modified;
                    context.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
    }
}