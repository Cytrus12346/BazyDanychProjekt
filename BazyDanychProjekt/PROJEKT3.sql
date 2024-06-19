CREATE TABLE Influencers (
 influencer_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 email VARCHAR(255) UNIQUE,
 followers INT,
 engagement_rate FLOAT
);
CREATE TABLE Campaigns (
 campaign_id INT AUTO_INCREMENT PRIMARY KEY,
 campaign_name VARCHAR(255) NOT NULL,
 start_date DATE,
 end_date DATE,
 budget DECIMAL(10,2)
);
CREATE TABLE MarketingActivities (
 activity_id INT AUTO_INCREMENT PRIMARY KEY,
 activity_name VARCHAR(255) NOT NULL,
 activity_date DATE,
 description TEXT,
 campaign_id INT,
 FOREIGN KEY (campaign_id) REFERENCES Campaigns (campaign_id)
);
CREATE TABLE Payments (
 payment_id INT AUTO_INCREMENT PRIMARY KEY,
 campaign_id INT,
 influencer_id INT,
 amount DECIMAL(10, 2),
 payment_date DATE,
 FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id),
 FOREIGN KEY (influencer_id) REFERENCES Influencers(influencer_id)
);

CREATE TABLE CampaignResults (
  result_id INT AUTO_INCREMENT PRIMARY KEY,
  campaign_id INT,
  impressions INT,
  clicks INT,
  conversions INT,
  revenue DECIMAL(10, 2),
  analysis_date DATE,
  FOREIGN KEY (campaign_id) REFERENCES Campaigns (campaign_id)
);
CREATE TABLE SocialMediaPosts (
  post_id INT AUTO_INCREMENT PRIMARY KEY,
  influencer_id INT,
  post_date DATE,
  platform VARCHAR(50),
  content TEXT,
  campaign_id INT,
  FOREIGN KEY (influencer_id) REFERENCES Influencers (influencer_id),
  FOREIGN KEY (campaign_id) REFERENCES Campaigns (campaign_id)
);
CREATE TABLE Companies (
  company_id INT AUTO_INCREMENT PRIMARY KEY,
  company_name VARCHAR(255) NOT NULL,
  industry VARCHAR(255),
  headquarters_location VARCHAR(255),
  website VARCHAR(255)
);
ALTER TABLE Campaigns
ADD COLUMN company_id INT,
ADD CONSTRAINT fk_company_campaign
  FOREIGN KEY (company_id)
  REFERENCES Companies(company_id);


INSERT INTO Influencers (name, email, followers, engagement_rate) VALUES
('Katarzyna Nowak', 'katarzyna.nowak@example.com', 10000, 0.05),
('Michał Wiśniewski', 'michal.wisniewski@example.com', 15000, 0.08),
('Piotr Kowalski', 'piotr.kowalski@example.com', 8000, 0.07),
('Anna Woźniak', 'anna.wozniak@example.com', 12000, 0.06),
('Krzysztof Lewandowski', 'krzysztof.lewandowski@example.com', 20000, 0.1),
('Magdalena Kamińska', 'magdalena.kaminska@example.com', 9000, 0.09),
('Adam Zieliński', 'adam.zielinski@example.com', 11000, 0.07),
('Agnieszka Szymańska', 'agnieszka.szymanska@example.com', 13000, 0.08),
('Marek Dąbrowski', 'marek.dabrowski@example.com', 18000, 0.09),
('Joanna Jankowska', 'joanna.jankowska@example.com', 9500, 0.06),
('Marcin Wojciechowski', 'marcin.wojciechowski@example.com', 16000, 0.07),
('Natalia Nowakowska', 'natalia.nowakowska@example.com', 8500, 0.08),
('Kamil Kaczmarek', 'kamil.kaczmarek@example.com', 14000, 0.07),
('Karolina Piotrowska', 'karolina.piotrowska@example.com', 17000, 0.08),
('Bartosz Pawlak', 'bartosz.pawlak@example.com', 20000, 0.09),
('Ewa Michalska', 'ewa.michalska@example.com', 11000, 0.07),
('Tomasz Adamczyk', 'tomasz.adamczyk@example.com', 13000, 0.08),
('Kinga Grabowska', 'kinga.grabowska@example.com', 9500, 0.06),
('Paweł Nowak', 'pawel.nowak@example.com', 16000, 0.07);

INSERT INTO Influencers (name, email, followers, engagement_rate) VALUES
('Kacper Woźniak', 'kacper.wozniak@example.com', 22000, 0.12),
('Zuzanna Kowalczyk', 'zuzanna.kowalczyk@example.com', 18000, 0.09),
('Oliwia Kamińska', 'oliwia.kaminska@example.com', 25000, 0.11),
('Jan Kowalski', 'jan.kowalski@example.com', 30000, 0.15),
('Wiktoria Nowak', 'wiktoria.nowak@example.com', 28000, 0.13),
('Mateusz Lewandowski', 'mateusz.lewandowski@example.com', 26000, 0.14),
('Natalia Wójcik', 'natalia.wojcik@example.com', 32000, 0.16),
('Filip Dąbrowski', 'filip.dabrowski@example.com', 34000, 0.17),
('Martyna Jankowska', 'martyna.jankowska@example.com', 29000, 0.14),
('Tymoteusz Wojciechowski', 'tymoteusz.wojciechowski@example.com', 27000, 0.13),
('Karina Kaczmarek', 'karina.kaczmarek@example.com', 31000, 0.15);
SELECT * FROM Influencers;

INSERT INTO Companies (company_name, industry, headquarters_location, website) VALUES
('AlphaTech', 'Technologie informatyczne', 'Warszawa, Polska', 'https://www.alphatech.com'),
('HealthCare Solutions', 'Zdrowie i opieka zdrowotna', 'Berlin, Niemcy', 'https://www.healthcaresolutions.com'),
('Capital Finance Group', 'Finanse i bankowość', 'Madryt, Hiszpania', 'https://www.capitalfinancegroup.com'),
('GlobalMart', 'Handel detaliczny', 'Rzym, Włochy', 'https://www.globalmart.com'),
('AutoWorks', 'Przemysł motoryzacyjny', 'Stambuł, Turcja', 'https://www.autoworks.com'),
('MediaPulse', 'Rozrywka i media', 'Toronto, Kanada', 'https://www.mediapulse.com'),
('FoodMaster', 'Żywność i napoje', 'Sydney, Australia', 'https://www.foodmaster.com'),
('EcoEnergy Solutions', 'Energia odnawialna', 'Johannesburg, RPA', 'https://www.ecoenergysolutions.com'),
('Architects Inc.', 'Architektura i budownictwo', 'São Paulo, Brazylia', 'https://www.architectsinc.com'),
('Education Dynamics', 'Edukacja i szkolenia', 'Moskwa, Rosja', 'https://www.educationdynamics.com');
SELECT * FROM Companies;


INSERT INTO Campaigns (campaign_name, start_date, end_date, budget, company_id) VALUES
('Letnia Promocja', '2024-06-01', '2024-06-30', 5000, 1),
('Nowy Produkt', '2024-06-01', '2024-06-30', 8000, 2),
('Konkurs Lato', '2024-07-01', '2024-07-31', 10000, 1),
('Event Firmowy', '2024-07-01', '2024-07-31', 6000, 3),
('Webinar Edukacyjny', '2024-08-01', '2024-08-31', 9000, 2),
('Premiera Filmu', '2024-08-01', '2024-08-31', 7000, 1),
('Promocja Letnia', '2024-09-01', '2024-09-30', 8500, 3),
('Nowa Kolekcja', '2024-09-01', '2024-09-30', 7500, 2);
SELECT * FROM Campaigns;

INSERT INTO SocialMediaPosts (influencer_id, post_date, platform, content, campaign_id) VALUES
(1, '2024-06-01', 'Instagram', 'Dzisiaj miała miejsce premiera nowego produktu! #nowość #premiera', 1),
(2, '2024-06-03', 'Facebook', 'Zapraszamy do udziału w naszym konkursie! #konkurs #nagrody', 2),
(3, '2024-06-05', 'Twitter', 'Dziękujemy naszym klientom za wsparcie! #klienci #wdzięczność', 3),
(4, '2024-06-07', 'Instagram', 'Ostatnie chwile promocji! Nie przegap okazji! #promocja #lastchance', 1),
(5, '2024-06-10', 'Facebook', 'Dziś ruszyliśmy z nową kampanią reklamową! #kampania #reklama', 2),
(6, '2024-06-12', 'Instagram', 'Zapraszamy na nasz nowy webinar! #webinar #szkolenie', 3),
(7, '2024-06-15', 'Twitter', 'Wkrótce odbędzie się premiera naszego nowego produktu! #nowość #premiera', 1),
(8, '2024-06-18', 'Facebook', 'Niezapomniane wrażenia z naszego eventu firmowego! #event #firmowy', 2),
(9, '2024-06-20', 'Instagram', 'Polecamy nasz produkt z całego serca! #rekomendacja #produkt', 3),
(10, '2024-06-22', 'Twitter', 'Dzisiaj rozpoczynamy naszą letnią promocję! #promocja #lato', 1),
(11, '2024-06-25', 'Facebook', 'Zapraszamy na nasze warsztaty online! #warsztaty #online', 2);
SELECT * FROM SocialMediaPosts;

INSERT INTO Payments (campaign_id, influencer_id, amount, payment_date) VALUES
(1, 1, 1000.00, '2024-06-05'),
(1, 2, 750.00, '2024-06-08'),
(2, 3, 1200.00, '2024-06-10'),
(2, 4, 900.00, '2024-06-15'),
(3, 5, 800.00, '2024-06-20'),
(3, 6, 1100.00, '2024-06-25');
SELECT * FROM Payments;

INSERT INTO CampaignResults (campaign_id, impressions, clicks, conversions, revenue, analysis_date) VALUES
(1, 50000, 2500, 100, 5000.00, '2024-07-01'),
(2, 75000, 3500, 150, 8000.00, '2024-07-05'),
(3, 60000, 3000, 120, 6000.00, '2024-07-10'),
(4, 55000, 2800, 110, 5500.00, '2024-07-15'),
(5, 60000, 3200, 130, 6500.00, '2024-07-20'),
(6, 80000, 4000, 180, 9000.00, '2024-07-25'),
(7, 70000, 3800, 160, 7500.00, '2024-07-30'),
(8, 65000, 3500, 140, 7000.00, '2024-08-05'),
(9, 72000, 3900, 170, 7800.00, '2024-08-10');
SELECT * FROM CampaignResults;

INSERT INTO MarketingActivities (activity_name, activity_date, description, campaign_id) VALUES
('Spotkanie z influencerami', '2024-06-03', 'Spotkanie z głównymi influencerami w naszej branży w celu omówienia współpracy.', 1),
('Reklama w social mediach', '2024-06-05', 'Uruchomienie kampanii reklamowej na platformach społecznościowych w celu zwiększenia zasięgu.', 2),
('Konkurs online', '2024-06-07', 'Rozpoczęcie konkursu online z nagrodami dla uczestników.', 3),
('Szkolenie dla pracowników', '2024-06-10', 'Organizacja szkolenia dla pracowników w celu podniesienia kompetencji marketingowych.', 1),
('Konferencja branżowa', '2024-06-15', 'Udział w konferencji branżowej w celu budowania relacji z partnerami i klientami.', 2),
('E-mail marketing', '2024-06-20', 'Wysłanie serii e-maili marketingowych do naszych subskrybentów.', 3),
('Organizacja eventu', '2024-06-25', 'Organizacja eventu promocyjnego w centrum handlowym.', 1),
('Webinar edukacyjny', '2024-06-30', 'Przeprowadzenie webinaru na temat najnowszych trendów w branży.', 2),
('Reklama z influencerami', '2024-07-05', 'Współpraca z influencerami w celu promocji naszych produktów.', 3);
SELECT * FROM MarketingActivities;

UPDATE Campaigns
SET budget = 15000.00
WHERE campaign_id = 3;

UPDATE Campaigns
SET start_date = '2024-07-15'
WHERE campaign_id = 4;

UPDATE Influencers
SET followers = 75000
WHERE influencer_id = 2;

UPDATE MarketingActivities
SET description = 'Prezentacja nowej kolekcji na targach branżowych.'
WHERE activity_id = 3;

UPDATE Payments
SET amount = 1200.00
WHERE influencer_id = 3;

SELECT * FROM Influencers WHERE followers > 22000;
SELECT * FROM MarketingActivities WHERE activity_date BETWEEN '2024-06-05' AND '2024-06-10';
SELECT payment_id, payment_date FROM Payments WHERE amount > 1000.00;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);
SELECT * FROM Roles;

CREATE TABLE UserRoles (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);
-- Admin
GRANT ALL PRIVILEGES ON *.* TO 'admin_user'@'localhost';

-- Menadżer firmy
GRANT SELECT, INSERT, UPDATE, DELETE ON company_data.* TO 'manager_user'@'localhost';

-- Influencer
GRANT SELECT ON campaign_data.* TO 'influencer_user'@'localhost';



