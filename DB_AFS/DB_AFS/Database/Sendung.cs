//------------------------------------------------------------------------------
// <auto-generated>
//     Der Code wurde von einer Vorlage generiert.
//
//     Manuelle Änderungen an dieser Datei führen möglicherweise zu unerwartetem Verhalten der Anwendung.
//     Manuelle Änderungen an dieser Datei werden überschrieben, wenn der Code neu generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DB_AFS.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sendung
    {
        public int Id { get; set; }
        public int KundeId { get; set; }
        public string Typ { get; set; }
        public int VonId { get; set; }
        public int NachId { get; set; }
    
        public virtual Kunde Kunde { get; set; }
        public virtual Ladestelle Nach { get; set; }
        public virtual Ladestelle Von { get; set; }
    }
}
