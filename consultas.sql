select L.Homo, E.Nombre from Ludantoj as L, Ekipannoj as E
    where L.Ekipanno = E.Id;

/*RESOLUCIÓN del 5*/
SELECT e.nombre AS Equipo,
       SUM(CASE WHEN m.gastiganto = e.id THEN m.CeloGastiganto ELSE m.CeloVizitanto END) AS GolesAFavor,
       SUM(CASE WHEN m.vizitanto = e.id THEN m.CeloGastiganto ELSE m.CeloVizitanto END) AS GolesEnContra,
       SUM(CASE WHEN m.gastiganto = e.id THEN m.CeloGastiganto ELSE m.CeloVizitanto END) - SUM(CASE WHEN m.gastiganto = e.id THEN m.CeloVizitanto ELSE m.CeloGastiganto END) AS DiferenciaGoles
FROM Ekipannoj e
LEFT JOIN Matxoj m ON e.id = m.gastiganto OR e.id = m.vizitanto
GROUP BY e.nombre;

/*SOLUCIÓN del 6*/
INSERT INTO Landoj(Nombre) VALUE("Uruguay");
INSERT into Ekipannoj(Lando, Nombre) VALUE(5,"Uruguay");
/*SOLUCIÓN del 7*/
DELETE FROM R_Arbitraci 
WHERE Matxo IN (
    SELECT ID 
    FROM Matxoj as M 
    WHERE M.Gastiganto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
    OR M.Vizitanto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
);

DELETE FROM R_BonaKredoj 
WHERE Matxo IN (
    SELECT ID 
    FROM Matxoj as M 
    WHERE M.Gastiganto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
    OR M.Vizitanto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
);

DELETE FROM Matxoj 
WHERE ID IN (
    SELECT ID 
    FROM Matxoj as M 
    WHERE M.Gastiganto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
    OR M.Vizitanto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
);
DELETE FROM Ludantoj 
WHERE Ekipanno IN(
    SELECT ID
    FROM Ekipannoj WHERE nombre ="Argentina"
);
DELETE FROM Teknikadirektoroj 
WHERE Ekipanno IN(
    SELECT ID
    FROM Ekipannoj WHERE nombre ="Argentina"
);
DELETE FROM Ekipannoj WHERE nombre="Argentina";

/*SOLUCIÓN del 8*/
INSERT INTO Matxoj(
    Gastiganto, Vizitanto, CeloGastiganto, CeloVizitanto, Fecha, Hora, Duracion,

    FlavaGastiganto, RuwaGastiganto, PunktoGastiganto,
    PilkoPosedoGastiganto,
    
    FlavaVizitanto, RuwaVizitanto, PunktoVizitanto,
    PilkoPosedoVizitanto) 
    VALUE(5,4,3,1, '2023-11-23', '10:00:00', '1:00:00',
    
    3, 1, 3, '00:10:10',
    5, 0, 0, '00:20:10');

UPDATE Matxoj as M
SET M.CeloGastiganto = M.CeloGastiganto+1
WHERE M.Gastiganto IN(
	select ID FROM Ekipannoj WHERE Nombre="Uruguay"
);
UPDATE Matxoj as M
SET M.CeloVizitanto = M.CeloVizitanto+1
WHERE M.Vizitanto IN(
	select ID FROM Ekipannoj WHERE Nombre="Uruguay"
)