USE sql_blog;

-- Problem: Standard LIKE queries are inefficient for text search
-- This query scans entire table and checks every row
SELECT *
FROM posts
WHERE title LIKE '%react redux%'
   OR body LIKE '%react redux%';

-- Issue 1: Regular indexes are ineffective for long text columns
-- Standard indexes work well for short strings (names, codes) but are meaningless for large text fields
-- Solution: Use full-text indexes designed specifically for text search

-- Issue 2: LIKE searches have limitations
-- Current query finds "react redux" but also matches "redux react" or text with words separated
-- Need exact phrase matching and word proximity control

-- Solution: Full-text indexes with MATCH() AGAINST() syntax
-- How it works: Creates inverted index of all words in specified columns
-- Benefits: Fast text search, relevance scoring, phrase matching, boolean operators

-- Task A: Create full-text index and perform basic text search
-- Creates composite full-text index on both title and body columns
-- Enables searching across multiple text columns simultaneously
CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

-- Basic full-text search using natural language mode (default)
-- Finds posts containing both "react" and "redux" words (order doesn't matter)
SELECT *
FROM posts
WHERE MATCH(title, body) AGAINST('react redux');

-- Task B: Get relevance scores for search results
-- MATCH() AGAINST() returns relevance score (higher = better match)
-- Similar to Google search results ranking
-- Score based on word frequency, proximity, and other factors
SELECT *, MATCH(title, body) AGAINST('react redux') AS relevance_score
FROM posts
WHERE MATCH(title, body) AGAINST('react redux');

-- Full-text search has two modes:
-- 1. Natural language mode (default): Finds relevant documents, ranks by relevance
-- 2. Boolean mode: Allows operators for precise control

-- Task C: Boolean mode search with exclusion operator
-- Uses minus (-) operator to exclude posts containing "redux"
-- Finds posts with "react" but NOT "redux"
SELECT *
FROM posts
WHERE MATCH(title, body) AGAINST('react -redux' IN BOOLEAN MODE);

-- Boolean mode with required term
-- Plus (+) operator makes "form" required
-- Finds posts with "react", without "redux", but must contain "form"
SELECT *
FROM posts
WHERE MATCH(title, body) AGAINST('react -redux +form' IN BOOLEAN MODE);

-- Task D: Exact phrase search
-- Double quotes search for exact phrase in exact order
-- Finds posts containing the exact phrase "handling a form"
SELECT *
FROM posts
WHERE MATCH(title, body) AGAINST('"handling a form"' IN BOOLEAN MODE);