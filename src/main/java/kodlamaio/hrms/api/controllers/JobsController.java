package kodlamaio.hrms.api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kodlamaio.hrms.business.abstracts.JobService;
import kodlamaio.hrms.entities.concretes.Job;

@RestController
@RequestMapping("/api/jobs")
public class JobsController {

	private JobService jobservice;
	
	@Autowired
	public JobsController(JobService jobservice) {
		super();
		this.jobservice = jobservice;
	}

	@GetMapping("/getall")
	public List<Job> getAll(){
		return this.jobservice.getAll();
	}
	 
}
