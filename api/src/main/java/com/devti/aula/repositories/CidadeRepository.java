package com.devti.aula.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devti.aula.model.Cidade;

public interface CidadeRepository extends JpaRepository<Cidade, Integer>{
	
	public List<Cidade> findByUf(String uf);

}
