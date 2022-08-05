copy public.projetos from 'C:\temp\letrus\prep\Ds1 - Analista Pleno.csv' with (format csv, delimiter ';', header , encoding 'windows-1251');

copy public.usuarios from 'C:\temp\letrus\prep\Ds2 - Analista Pleno.csv' with (format csv, delimiter ';', header , encoding 'windows-1251');

copy public.atividades from 'C:\temp\letrus\prep\Ds3 - Analista Pleno.csv' with (format csv, delimiter ';', header , encoding 'windows-1251');

copy public.nota from 'C:\temp\letrus\prep\Ds4 - Analista Pleno.csv' with (format csv, delimiter ';', header , encoding 'windows-1251');

insert into public.sexo(id, descricao) values(0,'feminino'), (1,'masculino');

insert into public.ativo(id, descricao) values(0,'não'), (1,'sim');