using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kairos.View
{
    public class Color
    {
        public enum Names
        {
            Teal, Blue, Purple, DarkPurple, 
            Red, Orange, Green, SkyBlue
        }

        public System.Drawing.Color Hard;
        public System.Drawing.Color Soft;

        private static System.Drawing.Color getColor(string rgb)
        {
            System.Drawing.ColorConverter cc = new System.Drawing.ColorConverter();
            return (System.Drawing.Color)cc.ConvertFromString(rgb);
        }

        public Color(string hard, string soft)
        {
            Hard = getColor(hard);
            Soft = getColor(soft);
        }

        public static Color Teal = new Color("#008299", "#00A0B1");
        public static Color Blue = new Color("#2672EC", "#2E8DEF");
        public static Color Purple = new Color("#8C0095", "#A700AE");
        public static Color DarkPurple = new Color("#5133AB", "#643EBF");
        public static Color Red = new Color("#AC193D", "#BF1E4B");
        public static Color Orange = new Color("#D24726", "#DC572E");
        public static Color Green = new Color("#008A00", "#00A600");
        public static Color SkyBlue = new Color("#094AB2", "#0A5BC4"); 

        public static Color getColor(Names colorName)
        {
            switch (colorName)
            {
                case Names.Teal:
                    return Teal;
                case Names.Blue:
                    return Blue;
                case Names.Purple:
                    return Purple;
                case Names.DarkPurple:
                    return DarkPurple;
                case Names.Red:
                    return Red;
                case Names.Orange:
                    return Orange;
                case Names.Green:
                    return Green;
                case Names.SkyBlue:
                    return SkyBlue;
                default:
                    return Green;
            }
        }
    }
}
