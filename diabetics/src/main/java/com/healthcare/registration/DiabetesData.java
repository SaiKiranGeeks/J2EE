package com.healthcare.registration;

public class DiabetesData {
    private String date;
    private String amTestTime;
    private String fastingBloodSugarLevel;
    //private String breakfastTime;
    private String breakfastFood;
    //private String lunchTime;
    private String lunchFood;
    //private String dinnerTime;
    private String dinnerFood;
    private String nightTestTime;
    private String sugarLevelAfterTwoHours;
    
    public String getDate() {
        return date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    
    public String getAmTestTime() {
        return amTestTime;
    }
    
    public void setAmTestTime(String amTestTime) {
        this.amTestTime = amTestTime;
    }
    
    public String getFastingBloodSugarLevel() {
        return fastingBloodSugarLevel;
    }
    
    public void setFastingBloodSugarLevel(String fastingBloodSugarLevel) {
        this.fastingBloodSugarLevel = fastingBloodSugarLevel;
    }
    
   
    
    public String getBreakfastFood() {
        return breakfastFood;
    }
    
    public void setBreakfastFood(String breakfastFood) {
        this.breakfastFood = breakfastFood;
    }
    
    
    
    public String getLunchFood() {
        return lunchFood;
    }
    
    public void setLunchFood(String lunchFood) {
        this.lunchFood = lunchFood;
    }
    
    
    
    public String getDinnerFood() {
        return dinnerFood;
    }
    
    public void setDinnerFood(String dinnerFood) {
        this.dinnerFood = dinnerFood;
    }
    
    public String getNightTestTime() {
        return nightTestTime;
    }
    
    public void setNightTestTime(String nightTestTime) {
        this.nightTestTime = nightTestTime;
    }
    
    public String getSugarLevelAfterTwoHours() {
        return sugarLevelAfterTwoHours;
    }
    
    public void setSugarLevelAfterTwoHours(String sugarLevelAfterTwoHours) {
        this.sugarLevelAfterTwoHours = sugarLevelAfterTwoHours;
    }
}

