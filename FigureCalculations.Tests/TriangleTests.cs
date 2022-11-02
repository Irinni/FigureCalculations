using FigureCalculations.Figures;
using System;
using System.Collections.Generic;
using Xunit;

namespace FigureCalculations.Tests
{
    public class TriangleTests
    {
        public static IEnumerable<object[]> GoodData =>
           new List<object[]>
           {
                new object[] {new Triangle(2.0, 3.0, 2.0), 1.984313483298443},
                new object[] {new Triangle(80.0, 76.0, 5.0), 116.93988840425665},
                new object[] {new Triangle(1.2, 0.4, 0.9), 0.1363589014329465},
           };

        [Theory]
        [MemberData(nameof(GoodData))]
        public void TriangleAreaCalculation_ValueMustBeAsExpected(IFigure figure, double expectedArea)
        {
            Assert.Equal(expectedArea, figure.Area);
        }

        [Theory]
        [InlineData(0, 0, 0)]
        [InlineData(-1, 3, 4)]
        [InlineData(-3, -3, -3)]
        [InlineData(-7, 9, 10)]
        [InlineData(7, -0.2, 10)]
        [InlineData(7, 6.2, -10)]
        [InlineData(0, 9, 10)]
        [InlineData(7, 0, 10)]
        [InlineData(7, 6.2, 0)]
        [InlineData(1, 3, 10)]
        [InlineData(10, 100, 10)]
        [InlineData(10, 100, 200)]
        [InlineData(1, 2, 3)]
        [InlineData(1.2, 0.9, 0.3)]
        public void TriangleAreaCalculation_ArgumentException(double a, double b, double c)
        {
            Action actual = () => new Triangle(a, b, c);
            Assert.Throws<ArgumentException>(actual);
        }

        [Fact]
        public void TriangleAreaCalculation_OverflowExseption()
        {
            var triangle = new Triangle(double.MaxValue, double.MaxValue, double.MaxValue);
            Assert.Throws<OverflowException>(() => { var result = triangle.Area; });
        }

        public static IEnumerable<object[]> RightAnglesData =>
           new List<object[]>
           {
                new object[] {new Triangle(3, 4, 5), 6.0},
                new object[] {new Triangle(3, 5, 4), 6.0},
                new object[] {new Triangle(5, 4, 3), 6.0},
           };

        [Theory]
        [MemberData(nameof(RightAnglesData))]
        public void TriangleAreaCalculation_RightAngle_ExpectedArea(Triangle triangle, double expectedArea)
        {
            Assert.True(triangle.IsRightAngle);
            Assert.Equal(expectedArea, triangle.Area);
        }
    }
}
