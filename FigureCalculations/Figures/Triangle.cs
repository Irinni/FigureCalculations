using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FigureCalculations.Figures
{
    // Т.к. нет требования к изменению параметров треугольника - стороны треугольника можно задать только при инициализации
    // Это позволит произволит вычислять дополнительные атрибуты (площадь) только 1 раз при первом обращении,
    // что ускоряет выполнение кода. Также данное решение упрощает поддержку и чтение кода.
    public class Triangle : IFigure
    {
        private const string errorIsNotTriangleMessage = "Wrong sides params. It isn't triangle";
        private const string errorNotPositiveValueParamsMessage = "Sides value can be only positive";
        public double A { get; }
        public double B { get; }
        public double C { get; }
        private double? _area = null;
        private bool? _isRightAngle = null;

        public double Area
        {
            get
            {
                if (!_area.HasValue)
                {
                    if (IsRightAngle)
                    {
                        if (A > B && A > C)
                            _area = B * C / 2.0;
                        else if (B > A && B > C)
                            _area = A * C / 2.0;
                        else
                            _area = A * B / 2.0;
                    }
                    else
                    {
                        double p = (A + B + C) / 2.0;
                        _area = Math.Sqrt(p * (p - A) * (p - B) * (p - C));
                    }
                }
                return _area.Value;
            }
        }
        public bool IsRightAngle
        {
            get
            {
                if (!_isRightAngle.HasValue)
                    _isRightAngle = (A > B && A > C && Math.Pow(A, 2) == Math.Pow(B, 2) + Math.Pow(C, 2))
                        || (B > A && B > C && Math.Pow(B, 2) == Math.Pow(C, 2) + Math.Pow(A, 2))
                        || (C > A && C > B && Math.Pow(C, 2) == Math.Pow(A, 2) + Math.Pow(B, 2));

                return _isRightAngle.Value;
            }
        }

        public Triangle(double a, double b, double c)
        {
            if (a <= 0 || b <= 0 || c <= 0)
                throw new ArgumentException(errorNotPositiveValueParamsMessage);
            if ((a + b < c) || (a + c < b) || (b + c < a))
                throw new ArgumentException(errorIsNotTriangleMessage);

            A = a;
            B = b;
            C = c;
        }
    }
}
