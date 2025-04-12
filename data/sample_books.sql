INSERT INTO book_language (language_name) VALUES
('English'),
('French'),
('Swahili');

INSERT INTO publisher (name) VALUES
('Heinemann African Writers Series'),
('Farafina Books'),
('Cassava Republic Press');

INSERT INTO book (title, language_id, publisher_id) VALUES
('Things Fall Apart', 1, 1),
('Half of a Yellow Sun', 1, 2),
('Weep Not, Child', 1, 1),
('Nervous Conditions', 1, 1),
('Everything Good Will Come', 1, 2),
('Death and the King\'s Horseman', 1, 1),
('The Secret Lives of Baba Segi\'s Wives', 1, 3),
('The Yearning', 1, 3);


INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);
