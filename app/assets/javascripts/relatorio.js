document.addEventListener('DOMContentLoaded', function () {
  const funcionarios = [
      { nome: 'Funcionário 1', salario: 1000 },
      { nome: 'Funcionário 2', salario: 1500 },
      { nome: 'Funcionário 3', salario: 2000 },
      { nome: 'Funcionário 4', salario: 2500 },
      { nome: 'Funcionário 5', salario: 3000 },
      { nome: 'Funcionário 6', salario: 4000 },
      { nome: 'Funcionário 7', salario: 5000 },
      { nome: 'Funcionário 8', salario: 6000 },
  ];

  const faixasSalariais = [
      { faixa: 'Até R$ 1.045,00', min: 0, max: 1045 },
      { faixa: 'De R$ 1.045,01 a R$ 2.089,60', min: 1045.01, max: 2089.6 },
      { faixa: 'De R$ 2.089,61 até R$ 3.134,40', min: 2089.61, max: 3134.4 },
      { faixa: 'De R$ 3.134,41 até R$ 6.101,06', min: 3134.41, max: 6101.06 },
  ];

  const relatorio = {};
  faixasSalariais.forEach(faixa => {
      relatorio[faixa.faixa] = funcionarios.filter(funcionario =>
          funcionario.salario >= faixa.min && funcionario.salario <= faixa.max
      ).length;
  });

  const relatorioDiv = document.getElementById('relatorio');
  relatorioDiv.innerHTML = '<h2>Relatório:</h2>';
  for (const faixa in relatorio) {
      relatorioDiv.innerHTML += `<p>${faixa}: ${relatorio[faixa]} funcionários</p>`;
  }

  const graficoCtx = document.getElementById('grafico').getContext('2d');
  const grafico = new Chart(graficoCtx, {
      type: 'bar',
      data: {
          labels: faixasSalariais.map(faixa => faixa.faixa),
          datasets: [{
              label: 'Funcionários por Faixa Salarial',
              data: faixasSalariais.map(faixa => relatorio[faixa.faixa]),
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });
});