//------------------------------------------------------------------------------
// <auto-generated>
//     Codice generato da un modello.
//
//     Le modifiche manuali a questo file potrebbero causare un comportamento imprevisto dell'applicazione.
//     Se il codice viene rigenerato, le modifiche manuali al file verranno sovrascritte.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DFLWebForm.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Mails
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public System.DateTime CreatedOnUtc { get; set; }
        public System.DateTime LastSendUtc { get; set; }
        public string Subject { get; set; }
        public string Text { get; set; }
        public int LanguageId { get; set; }
    }
}
