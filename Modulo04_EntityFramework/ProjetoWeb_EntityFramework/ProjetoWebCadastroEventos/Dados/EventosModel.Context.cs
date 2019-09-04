﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjetoWebCadastroEventos.Dados
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class EventosEntities : DbContext
    {
        public EventosEntities()
            : base("name=EventosEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Convidado> Convidados { get; set; }
        public virtual DbSet<Evento> Eventos { get; set; }
    
        public virtual int pr_incluir_convidado(string cpf, Nullable<int> idevento, string nome, string telefone, string email, ObjectParameter status)
        {
            var cpfParameter = cpf != null ?
                new ObjectParameter("cpf", cpf) :
                new ObjectParameter("cpf", typeof(string));
    
            var ideventoParameter = idevento.HasValue ?
                new ObjectParameter("idevento", idevento) :
                new ObjectParameter("idevento", typeof(int));
    
            var nomeParameter = nome != null ?
                new ObjectParameter("nome", nome) :
                new ObjectParameter("nome", typeof(string));
    
            var telefoneParameter = telefone != null ?
                new ObjectParameter("telefone", telefone) :
                new ObjectParameter("telefone", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("pr_incluir_convidado", cpfParameter, ideventoParameter, nomeParameter, telefoneParameter, emailParameter, status);
        }
    }
}
