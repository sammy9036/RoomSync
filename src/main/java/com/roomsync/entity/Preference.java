package com.roomsync.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "preference")
public class Preference {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true, nullable = false)
    private User user;

    private int budget;

    private String lifestyle;      // e.g. Quiet, Social

    private String food;           // Veg, Non-Veg

    private String sleepSchedule;  // Early, Late

    private String cleanliness;    // Low, Medium, High

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public String getLifestyle() {
		return lifestyle;
	}

	public void setLifestyle(String lifestyle) {
		this.lifestyle = lifestyle;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getSleepSchedule() {
		return sleepSchedule;
	}

	public void setSleepSchedule(String sleepSchedule) {
		this.sleepSchedule = sleepSchedule;
	}

	public String getCleanliness() {
		return cleanliness;
	}

	public void setCleanliness(String cleanliness) {
		this.cleanliness = cleanliness;
	}

    
}
