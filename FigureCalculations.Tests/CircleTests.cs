using FigureCalculations.Figures;
using System;
using System.Collections.Generic;
using Xunit;

namespace FigureCalculations.Tests
{
    public class CircleTests
    {
        public static IEnumerable<object[]> Data =>
            new List<object[]>
            {
                new object[] {new Circle(0.0), 0.0},
                new object[] {new Circle(1.0), Math.PI},
                new object[] {new Circle(1), Math.PI},
            };

        [Theory]
        [MemberData(nameof(Data))]
        public void CircleAreaCalculation_ValueMustBeAsExpected(IFigure figure, double expectedArea)
        {
            Assert.Equal(expectedArea, figure.Area);
        }

        [Fact]
        public void CircleAreaCalculation_OverflowExseption()
        {
            var cicle = new Circle(double.MaxValue);
            Assert.Throws<OverflowException>(() => { var result = cicle.Area; });
        }

        [Fact]
        public void CircleAreaCalculation_ArgumentException()
        {
            Action actual = () => new Circle(-1234.0);
            Assert.Throws<ArgumentException>(actual);
        }
    }
}