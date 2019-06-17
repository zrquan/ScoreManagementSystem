$(document).ready(function () {
    let courses = [];
    let values = [];
    scoreJson.forEach((s) => {
        courses.push(s.course.name);
        values.push(s.value);
    });

    // ------------------------------------------------------- //
    // Charts Gradients
    // ------------------------------------------------------ //
    let ctx1 = $("canvas").get(0).getContext("2d");
    let gradient1 = ctx1.createLinearGradient(150, 0, 150, 300);
    gradient1.addColorStop(0, 'rgba(133, 180, 242, 0.91)');
    gradient1.addColorStop(1, 'rgba(255, 119, 119, 0.94)');

    let gradient2 = ctx1.createLinearGradient(146.000, 0.000, 154.000, 300.000);
    gradient2.addColorStop(0, 'rgba(104, 179, 112, 0.85)');
    gradient2.addColorStop(1, 'rgba(76, 162, 205, 0.85)');

    // ------------------------------------------------------- //
    // Line Chart
    // ------------------------------------------------------ //
    let LINECHARTEXMPLE = $('#scoreDis');
    let lineChartExample = new Chart(LINECHARTEXMPLE, {
        type: 'line',
        options: {
            legend: {labels: {fontColor: "#777", fontSize: 12}},
            scales: {
                xAxes: [{
                    display: true,
                    gridLines: {
                        color: '#eee'
                    }
                }],
                yAxes: [{
                    display: true,
                    gridLines: {
                        color: '#eee'
                    }
                }]
            },
        },
        data: {
            labels: courses,
            datasets: [
                {
                    label: "你的成绩",
                    fill: true,
                    lineTension: 0.3,
                    backgroundColor: gradient1,
                    borderColor: gradient1,
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    borderWidth: 1,
                    pointBorderColor: gradient1,
                    pointBackgroundColor: "#fff",
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: gradient1,
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointHoverBorderWidth: 2,
                    pointRadius: 1,
                    pointHitRadius: 10,
                    data: values,
                    spanGaps: false
                },
                {
                    label: "平均成绩",
                    fill: true,
                    lineTension: 0.3,
                    backgroundColor: gradient2,
                    borderColor: gradient2,
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    borderWidth: 1,
                    pointBorderColor: gradient2,
                    pointBackgroundColor: "#fff",
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: gradient2,
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointHoverBorderWidth: 2,
                    pointRadius: 1,
                    pointHitRadius: 10,
                    // TODO
                    data: values,
                    spanGaps: false
                }
            ]
        }
    });

    // ------------------------------------------------------- //
    // Pie Chart
    // ------------------------------------------------------ //
    var PIECHART = $('#gpaDis');
    var myPieChart = new Chart(PIECHART, {
        type: 'doughnut',
        options: {
            cutoutPercentage: 80,
        },
        data: {
            labels: [
                "专必",
                "公必",
                "专选",
                "公选"
            ],
            datasets: [
                {
                    data: creditList,
                    borderWidth: [0, 0, 0, 0],
                    backgroundColor: [
                        '#3eb579',
                        '#49cd8b',
                        "#54e69d",
                        "#71e9ad"
                    ],
                    hoverBackgroundColor: [
                        '#3eb579',
                        '#49cd8b',
                        "#54e69d",
                        "#71e9ad"
                    ]
                }]
        }
    });

});
