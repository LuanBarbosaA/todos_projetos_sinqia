using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjetoWebCadastroEventos.Dados;

namespace ProjetoWebCadastroEventos.DAL
{
    public class EventosDao
    {
        public static void IncluirEvento(Evento evento)
        {
            using (var context = new EventosEntities())
            {
                context.Eventos.Add(evento);
                context.SaveChanges();
            }
        }
        public static List<Evento> ListarEvento()
        {
            using (var context = new EventosEntities())
            {
                return context.Eventos.ToList();
            }
        }
        public static Evento BuscarEvento(int id)
        {
            using (var context = new EventosEntities())
            {
                return context.Eventos.FirstOrDefault(p => p.Id == id);
            }
        }
    }
}