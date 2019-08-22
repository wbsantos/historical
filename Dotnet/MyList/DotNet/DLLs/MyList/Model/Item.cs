using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace MyList.Model
{
    [Serializable]
    public class Item
    {
        public int ID { get; set; }
        public string Titulo { get; set; }
        public string Sinopse { get; set; }
        public float Score { get; set; }

        public Propriedades Propriedades { get; set; }
        public Categoria Categoria { get; set; } = new Categoria();
        public Generos Generos { get; set; }

        [ScriptIgnore]
        public Saga Saga { get; set; }
        [ScriptIgnore]
        public string ImageLink => Propriedades[Propriedade.Label.ImageLink];
        [ScriptIgnore]
        public int AnoLancamento => Convert.ToInt32(Propriedades[Propriedade.Label.AnoInicial]);
    }

    [Serializable]
    public class Propriedade
    {
        public enum Label
        {
            Indefinido = 0, 
            ImageLink = 1,
            MyAnimeListLink = 2,
            AnoInicial = 3,
            AnoFinal = 4,
            EpisodiosTotais = 5,
        }

        public int ID { get; set; }
        public Label Tipo { get; set; }
        public string Value { get; set; }
    }

    [Serializable]
    public class Propriedades : List<Propriedade>
    {
        [ScriptIgnore]
        public string this[Propriedade.Label index] => this.FirstOrDefault(x => x.Tipo == index)?.Value;
    }

    [Serializable]
    public class Saga : List<Item>
    {
        public int ID { get; set; }
        public string Titulo { get; set; }
    }

    [Serializable]
    public class Sagas : List<Saga>
    {

    }
}