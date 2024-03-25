// app/assets/javascripts/proponents.js

document.addEventListener("turbolinks:load", function() {
  var ctx = document.getElementById("salaryChart").getContext('2d');
  var salaryChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: <%= @employees_by_salary_range.keys.to_json %>,
      datasets: [{
        label: 'Funcionários por Faixa Salarial',
        data: <%= @employees_by_salary_range.values.to_json %>,
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  });
});