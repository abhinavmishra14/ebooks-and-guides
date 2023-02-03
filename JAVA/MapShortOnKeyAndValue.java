package CollectionFramework;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

/**
 * The Class HashMapShortOnKeyAndValue.
 * @author Abhinav Kumar Mishra
 */
public class MapShortOnKeyAndValue {
	
	/**
	 * The main method.
	 * @param args the arguments
	 */
	public static void main(String[] args) {
		int choice=0;
		Scanner sc= new Scanner(System.in);
		System.out.println("Enter a choice for sorting of map-->");
		System.out.println("Choice 1:HashMapShortOnKey");
		System.out.println("Choice 2:HashMapShortOnValue");
		System.out.println("Choice 0:Exit");
		choice=sc.nextInt();
		switch (choice) {
		case 1:
			MapShortOnKey.getSortedResultForHashMapBasedOnKey();
			break;
		case 2:
			MapShortOnValue.getSortedResultForHashMapBasedOnValue();
			break;
		default:
			break;
			
		}
	}
}

/**
 * The Class HashMapShortOnKey.
 */
class MapShortOnKey{
	
	/**
	 * Gets the sorted result for hash map based on key.
	 * @return the sorted result for hash map based on key
	 */
	public static void getSortedResultForHashMapBasedOnKey(){
	  Map<Person, Object> map= new HashMap<Person, Object>();
	  map.put(new Person("Abhi", 25), "Abhinav");
	  map.put(new Person("Bishu", 21), "Bishwas");
	  map.put(new Person("Raj", 26), "Rahul");
	  map.put(new Person("Kunnu", 28), "Kunal");
	  System.out.println("Unsorted map: "+map);
	  Map<Person,Object> sortedMapAgeBased= new TreeMap<Person, Object>(new AgeComparatorForKeyBasedSorting());
	  sortedMapAgeBased.putAll(map);
	  System.out.println("Sorted on basis of age: "+sortedMapAgeBased);
	  Map<Person,Object> sortedMapNameBased= new TreeMap<Person, Object>(new NameComparatorForKeyBasedSorting());
	  sortedMapNameBased.putAll(map);
	  System.out.println("Sorted on basis of name: "+sortedMapNameBased);
	}
}

/**
 * The Class AgeComparatorForKeyBasedSorting.
 */
class AgeComparatorForKeyBasedSorting implements Comparator<Person>{
	
	/**
	 * Instantiates a new age comparator for key based sorting.
	 */
	AgeComparatorForKeyBasedSorting(){
		super();
	}

	/* (non-Javadoc)
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	public int compare(Person o1, Person o2) {
        int retType;
		if(o1.age>o2.age){
			retType=1;
		}else if(o1.age<o2.age){
			retType=-1;
		}else{
			retType=0;
		}
		return retType;
	}
}

/**
 * The Class NameComparatorForKeyBasedSorting.
 */
class NameComparatorForKeyBasedSorting implements Comparator<Person>{
	
	/**
	 * Instantiates a new name comparator for key based sorting.
	 */
	NameComparatorForKeyBasedSorting(){
		super();
	}

	/* (non-Javadoc)
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	public int compare(Person o1, Person o2) {
       return o1.name.compareToIgnoreCase(o2.name);
	}
}


/**
 * The Class HashMapShortOnValue.
 */
class MapShortOnValue{
	
	/**
	 * Gets the sorted result for hash map based on value.
	 *
	 * @return the sorted result for hash map based on value
	 */
	public static void getSortedResultForHashMapBasedOnValue(){
		  Map<Person, Object> map= new HashMap<Person, Object>();
		  map.put(new Person("Abhi", 25), "Abhinav");
		  map.put(new Person("Bishu", 21), "Vivek");
		  map.put(new Person("Raj", 26), "Rahul");
		  map.put(new Person("Kunnu", 28), "Kunal");
		  System.out.println("Unsorted hashMap: "+map);
	      Map<Person, Object> sortedMapOnVal=new TreeMap<Person, Object>(new HashMapValueComparator(map));
	      sortedMapOnVal.putAll(map);
	      System.out.println("Sorted map based on values: "+sortedMapOnVal);
	}
}

/**
 * The Class HashMapValueComparator.
 */
class HashMapValueComparator implements Comparator<Object>{
	
	/** The map. */
	Map<Person, Object> map;
	
	/**
	 * Instantiates a new hash map value comparator.
	 */
	HashMapValueComparator(){
		super();
	}
	
	/**
	 * Instantiates a new hash map value comparator.
	 * @param map the map
	 */
	HashMapValueComparator(Map<Person, Object> map){
		super();
		this.map=map;
	}
	
	/* (non-Javadoc)
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	public int compare(Object o1, Object o2){
		int retType;
		
		Object v1=map.get(o1);
		Object v2=map.get(o2);
		
		if(v1 instanceof String && v2 instanceof String){
			if(v1.toString().toLowerCase().hashCode()>v2.toString().toLowerCase().hashCode()){
				retType=1;
			}else if(v1.toString().toLowerCase().hashCode()<v2.toString().toLowerCase().hashCode()){
				retType=-1;
			}
			else{
				retType=0;
			}
		}else{
			if(v1.hashCode()>v2.hashCode()){
				retType=1;
			}else if(v1.hashCode()<v2.hashCode()){
				retType=-1;
			}
			else{
				retType=0;
			}
		}
		return retType;
	}
}

/**
 * The Class Person.
 */
class Person{
	/** The age. */
	int age;
	/** The name. */
	String name;
	
	/**
	 * Instantiates a new person.
	 */
	Person(){
		super();
	}
	
	/**
	 * Instantiates a new person.
	 * @param name the name
	 * @param age the age
	 */
	Person(String name,int age){
		super();
		this.name=name;
		this.age=age;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString(){
		return name+" | "+age; 
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	public boolean equals(Object o){
     Person p=(Person)o;
     return this.age==p.age && this.name.equals(p.name);
	}
}
