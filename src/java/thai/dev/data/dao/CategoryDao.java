package thai.dev.data.dao;

import java.util.List;

import thai.dev.data.model.Category;

public interface CategoryDao {

    public  List<Category> findPaginated(int currentPage, int PAGE_SIZE);

    public boolean insert(Category category);

    public boolean update(Category category);

    public boolean delete(int id);

    public Category find(int id);

    public List<Category> findAll();

    public List<Category> hotCategory();

    public int countAll();
}
