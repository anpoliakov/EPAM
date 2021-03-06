package by.epam.task1.sorts;

import by.epam.task1.models.AbstractToy;

import java.util.Comparator;

/* This class sorts toys by name */
public class SortByName implements Comparator<AbstractToy> {
    public int compare(AbstractToy o1, AbstractToy o2) {
        return o1.getName().compareTo(o2.getName());
    }
}
