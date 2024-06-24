using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZstdSharp.Unsafe;

namespace ExamProject.Classes
{
    public class Product
    {
        public string NameProduct { get; set; }
        public string? Description { get; set; }
        public int IdManufacturer { get; set; }
        public int Category { get; set; }
        public decimal FirstPrice { get; set; }
        public int Discount { get; set; }

        public decimal LastPrice { get; set; }
    }
}
