DROP TABLE IF EXISTS `inegi_estados`;
CREATE TABLE `inegi_estados` (
  `cvegeo` varchar(10) NOT NULL,
  `cve_agee` text,
  `nom_agee` text,
  `nom_abrev` text,
  `pob` text,
  `pob_fem` text,
  `pob_mas` text,
  `viv` text,
  `geometry` longtext,
  PRIMARY KEY `ix_inegi_estados_cvegeo` (`cvegeo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `inegi_municipios`;
CREATE TABLE `inegi_municipios` (
  `cvegeo` varchar(10) NOT NULL,
  `cve_agee` text,
  `cve_agem` text,
  `nom_agem` text,
  `cve_cab` text,
  `nom_cab` text,
  `pob` text,
  `pob_fem` text,
  `pob_mas` text,
  `viv` text,
  `geometry` longtext,
  PRIMARY KEY `ix_inegi_municipios_cvegeo` (`cvegeo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

set @p = GeomFromText('POINT(-90.74256236075763 18.606120504092193)');
select nom_agem FROM inegi_municipios
where ST_Contains(new_geometry, @p);