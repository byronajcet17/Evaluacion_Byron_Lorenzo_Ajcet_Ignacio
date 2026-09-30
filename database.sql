-- =============================================================================
-- ESTRUCTURA DE LA BASE DE DATOS: SISTEMA DE POSTULACIONES
-- Motor: PostgreSQL
-- =============================================================================

-- Limpieza preventiva de tablas si existen
DROP TABLE IF EXISTS applications CASCADE;
DROP TABLE IF EXISTS vacancies CASCADE;
DROP TABLE IF EXISTS candidates CASCADE;

-- 1. Tabla de Candidatos
CREATE TABLE candidates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    years_of_experience INT NOT NULL CHECK (years_of_experience >= 0)
);

-- 2. Tabla de Vacantes
CREATE TABLE vacancies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    min_years_experience INT NOT NULL CHECK (min_years_experience >= 0),
    status VARCHAR(20) NOT NULL DEFAULT 'OPEN' CHECK (status IN ('OPEN', 'CLOSED'))
);

-- 3. Tabla de Postulaciones
CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    candidate_id INT NOT NULL REFERENCES candidates(id) ON DELETE RESTRICT,
    vacancy_id INT NOT NULL REFERENCES vacancies(id) ON DELETE RESTRICT,
    cover_letter TEXT NOT NULL,
    source VARCHAR(20) NOT NULL CHECK (source IN ('REFERRAL', 'INTERNAL', 'JOB_BOARD', 'OTHER')),
    score INT NOT NULL CHECK (score >= 0),
    priority VARCHAR(10) NOT NULL CHECK (priority IN ('LOW', 'MEDIUM', 'HIGH', 'TOP')),
    status VARCHAR(20) NOT NULL DEFAULT 'RECEIVED' CHECK (status IN ('RECEIVED', 'IN_REVIEW', 'REJECTED', 'HIRED')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- ÍNDICES PARA OPTIMIZACIÓN DE CONSULTAS
-- =============================================================================

-- Índice para el ordenamiento requerido en GET /applications (score DESC, created_at ASC)
CREATE INDEX idx_applications_score_created_at 
ON applications (score DESC, created_at ASC);

-- Índice para acelerar filtros combinados por estado y vacante
CREATE INDEX idx_applications_status_vacancy 
ON applications (status, vacancy_id);

-- Índice para consultas por candidato (regla de duplicidad y conteo de postulaciones activas)
CREATE INDEX idx_applications_candidate_id 
ON applications (candidate_id);


-- =============================================================================
-- DATOS SEMILLA (SEED DATA)
-- =============================================================================

-- Inserción de al menos 3 candidatos requeridos
INSERT INTO candidates (name, email, years_of_experience) VALUES
('Carlos Mendoza', 'carlos.mendoza@example.com', 4),
('Ana Sofía Rodríguez', 'ana.rodriguez@example.com', 2),
('David Gómez', 'david.gomez@example.com', 6);

-- Inserción de al menos 2 vacantes requeridas (una en estado CLOSED)
INSERT INTO vacancies (title, min_years_experience, status) VALUES
('Desarrollador Backend Senior', 3, 'OPEN'),
('Analista de Datos', 2, 'CLOSED');