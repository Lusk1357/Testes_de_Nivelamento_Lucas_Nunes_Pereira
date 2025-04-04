USE Relatorios;

-- 10 operadoras com maiores despesas no último trimestre
WITH UltimoPeriodo AS (
    SELECT MAX(ANO) AS ANO, MAX(TRIMESTRE) AS TRIMESTRE
    FROM demonstracoes_contabeis
)

SELECT 
    dc.REG_ANS, 
    rc.Razao_Social,
    rc.Nome_Fantasia,
    SUM(dc.VL_SALDO_FINAL) AS DespesaTotal
FROM demonstracoes_contabeis dc
JOIN Relatorio_cadop rc ON dc.REG_ANS = rc.Registro_ANS
JOIN UltimoPeriodo up ON dc.ANO = up.ANO AND dc.TRIMESTRE = up.TRIMESTRE
WHERE 
    dc.DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS%' 
    OR dc.DESCRICAO LIKE '%AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
GROUP BY dc.REG_ANS, rc.Razao_Social
ORDER BY DespesaTotal DESC
LIMIT 10;


-- 10 operadoras com maiores despesas no último ano
SELECT 
    dc.REG_ANS AS Codigo_ANS,
    rc.Razao_Social,
    rc.Nome_Fantasia,
    SUM(dc.VL_SALDO_FINAL - dc.VL_SALDO_INICIAL) AS DespesaAnual
FROM Relatorios.demonstracoes_contabeis dc
JOIN Relatorios.relatorio_cadop rc ON dc.REG_ANS = rc.Registro_ANS
WHERE 
    dc.ANO = (SELECT MAX(ANO) FROM Relatorios.demonstracoes_contabeis)
    AND (dc.DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS%' 
        OR dc.DESCRICAO LIKE '%AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%')
GROUP BY dc.REG_ANS, rc.Razao_Social, rc.Nome_Fantasia
ORDER BY DespesaAnual DESC
LIMIT 10;