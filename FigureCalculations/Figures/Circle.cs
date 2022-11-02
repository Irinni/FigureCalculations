namespace FigureCalculations.Figures
{
    // Т.к. нет требования к изменению параметров треугольника - стороны треугольника можно задать только при инициализации
    // Это позволит произволит вычислять дополнительные атрибуты (площадь) только 1 раз при первом обращении,
    // что ускоряет выполнение кода. Также данное решение упрощает поддержку и чтение кода.
    public class Circle : IFigure
    {
        private const string errorNegativeRadiusMessage = "Radius can't be negative";
        public double Radius { get; private set; }
        private double? _area = null;

        public Circle(double r)
        {
            if (r < 0)
                throw new ArgumentException(errorNegativeRadiusMessage);
            else
                Radius = r;
        }
        public double Area
        {
            get
            {
                if (!_area.HasValue)
                    _area = Math.PI * Math.Pow(Radius, 2);

                if (double.IsInfinity(_area.Value))
                {
                    throw new OverflowException();
                }
                return _area.Value;
            }
        }
    }
}
