-- Création de la base de données
USE group_rh;

-- Table company
CREATE TABLE company IF NOT EXISTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Table service
CREATE TABLE service IF NOT EXISTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Table company_has_service (table de liaison)
CREATE TABLE company_has_service IF NOT EXISTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    service_id INT NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES service(id) ON DELETE CASCADE,
    UNIQUE KEY unique_company_service (company_id, service_id)
);

-- Table employee
CREATE TABLE employee IF NOT EXISTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    lastname VARCHAR(100) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    occupation VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    company_has_service_id INT,
    FOREIGN KEY (company_has_service_id) REFERENCES company_has_service(id) ON DELETE SET NULL
);


-- Insertion des companies
INSERT INTO company (name) VALUES
('TechCorp Solutions'),
('Innovatech Group'),
('DataSystems International');

-- Insertion des services
INSERT INTO service (name) VALUES
('Ressources Humaines'),
('Développement Web'),
('Marketing Digital'),
('Finance et Comptabilité'),
('Support Technique'),
('Recherche et Développement'),
('Ventes et Commerce'),
('Production'),
('Qualité et Sécurité'),
('Logistique');

-- Insertion des relations company_has_service (certaines sans employés)
INSERT INTO company_has_service (company_id, service_id) VALUES
-- TechCorp Solutions (id:1)
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
-- Innovatech Group (id:2)
(2, 1), (2, 2), (2, 6), (2, 7), (2, 8),
-- DataSystems International (id:3)
(3, 1), (3, 4), (3, 5), (3, 9), (3, 10),
-- Services supplémentaires sans employés
(1, 6), (2, 9), (3, 2);

-- Insertion des 50 employés (avec des homonymes)
INSERT INTO employee (lastname, firstname, birthdate, occupation, salary, company_has_service_id) VALUES
-- Homonymes Martin
('Martin', 'Jean', '1985-03-15', 'Développeur Frontend', 45000.00, 2),
('Martin', 'Marie', '1990-07-22', 'Chef de projet', 55000.00, 1),
('Martin', 'Pierre', '1988-11-30', 'Analyste financier', 48000.00, 4),
('Martin', 'Sophie', '1992-05-14', 'Community Manager', 38000.00, 3),

-- Homonymes Dubois
('Dubois', 'Thomas', '1987-09-18', 'Ingénieur DevOps', 52000.00, 2),
('Dubois', 'Julie', '1991-12-05', 'Responsable RH', 47000.00, 1),
('Dubois', 'Michel', '1983-02-28', 'Directeur marketing', 65000.00, 3),
('Dubois', 'Céline', '1989-06-19', 'Comptable', 42000.00, 4),

-- Homonymes Bernard
('Bernard', 'Philippe', '1986-08-12', 'Technicien support', 35000.00, 5),
('Bernard', 'Émilie', '1993-04-25', 'Développeuse Backend', 46000.00, 2),
('Bernard', 'Antoine', '1984-01-07', 'Responsable R&D', 60000.00, 6),
('Bernard', 'Caroline', '1990-10-15', 'Commerciale', 40000.00, 7),

-- Autres employés
('Moreau', 'David', '1988-03-22', 'Designer UX/UI', 43000.00, 2),
('Petit', 'Sarah', '1992-07-08', 'Assistante RH', 32000.00, 1),
('Robert', 'Nicolas', '1985-11-14', 'Ingénieur qualité', 48000.00, 9),
('Richard', 'Laure', '1989-09-30', 'Analyste données', 51000.00, 10),
('Durand', 'François', '1987-05-17', 'Responsable logistique', 52000.00, 10),
('Leroy', 'Stéphanie', '1991-02-11', 'Chargée de communication', 39000.00, 3),
('Simon', 'Mathieu', '1986-12-03', 'Développeur Fullstack', 49000.00, 2),
('Michel', 'Isabelle', '1984-08-19', 'Contrôleuse de gestion', 53000.00, 4),
('Lefebvre', 'Patrick', '1983-06-26', 'Technicien réseau', 37000.00, 5),
('Garcia', 'Élodie', '1993-01-14', 'Chef de produit', 56000.00, 6),
('David', 'Vincent', '1988-04-09', 'Ingénieur système', 54000.00, 5),
('Bertrand', 'Nathalie', '1987-07-23', 'Responsable administrative', 45000.00, 1),
('Roux', 'Sébastien', '1985-10-31', 'Consultant technique', 58000.00, 2),
('Fontaine', 'Christine', '1989-03-12', 'Assistante commerciale', 34000.00, 7),
('Mercier', 'Olivier', '1986-11-28', 'Ingénieur test', 47000.00, 9),
('Blanc', 'Valérie', '1992-08-15', 'Développeuse mobile', 46000.00, 2),
('Guerin', 'Alexandre', '1984-05-07', 'Architecte logiciel', 62000.00, 2),
('Muller', 'Corinne', '1990-12-19', 'Contrôleuse qualité', 41000.00, 9),
('Henry', 'Jérôme', '1987-09-24', 'Technicien helpdesk', 36000.00, 5),
('Rousseau', 'Aurélie', '1991-06-11', 'Chargée de recrutement', 43000.00, 1),
('Fournier', 'Guillaume', '1988-02-05', 'Ingénieur cloud', 57000.00, 2),
('Morel', 'Sandrine', '1985-07-29', 'Responsable financière', 59000.00, 4),
('Girard', 'Thierry', '1983-04-16', 'Directeur technique', 70000.00, 2),
('André', 'Virginie', '1989-10-22', 'Marketing manager', 52000.00, 3),
('Lefevre', 'Romain', '1986-01-13', 'Data scientist', 61000.00, 6),
('Barbier', 'Cécile', '1992-03-08', 'Assistante marketing', 33000.00, 3),
('Renard', 'Pascal', '1984-08-27', 'Ingénieur sécurité', 58000.00, 9),
('Roussel', 'Hélène', '1990-05-14', 'Développeuse web', 44000.00, 2),
('Colin', 'Frédéric', '1987-12-06', 'Responsable production', 56000.00, 8),
('Arnaud', 'Sylvie', '1985-09-19', 'Analyste business', 50000.00, 7),
('Picard', 'Éric', '1988-06-23', 'Technicien maintenance', 38000.00, 5),
('Clement', 'Laurence', '1991-11-17', 'Chargée de formation', 42000.00, 1),
('Gauthier', 'Didier', '1983-02-14', 'Ingénieur R&D', 59000.00, 6),
('Fabre', 'Stéphane', '1989-07-31', 'Consultant ERP', 63000.00, 4),
('Brun', 'Christophe', '1986-04-12', 'Administrateur base de données', 55000.00, 10);