package edu.jwj439.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import edu.jwj439.sys.dao.MenuMapper;
import edu.jwj439.sys.entity.Menu;
import edu.jwj439.sys.service.IMenuService;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

	@Autowired
	private MenuMapper menuDao;

	/**
	 * 查询所有菜单返回
	 * 
	 * @param menuVo
	 * @return
	 */
	@Override
	public List<Menu> queryAllMenuForList(MenuVo menuVo) {
		return menuDao.queryAllMenu(menuVo);
	}

	/**
	 * @param menuVo
	 * @param userId
	 * @return
	 */
	@Override
	public List<Menu> queryMenuByUserIdForList(MenuVo menuVo, Integer userId) {
		return menuDao.queryMenuByUid(menuVo.getAvailable(), userId);
	}

	/**
	 * 查询所有菜单列表
	 * 
	 * @param menuVo
	 * @return
	 */
	@Override
	public DataGridView queryAllMenu(MenuVo menuVo) {
		Page<Object> page = PageHelper.startPage(menuVo.getPage(), menuVo.getLimit());
		List<Menu> data = this.menuDao.queryAllMenu(menuVo);
		return new DataGridView(page.getTotal(), data);
	}

	/**
	 * 添加菜单
	 * 
	 * @param menuVo
	 */
	@Override
	public void addMenu(MenuVo menuVo) {
		this.menuDao.insertSelective(menuVo);
	}

	/**
	 * 更新菜单
	 * 
	 * @param menuVo
	 */
	@Override
	public void updateMenu(MenuVo menuVo) {
		this.menuDao.updateByPrimaryKeySelective(menuVo);
	}

	/**
	 * 根据pid查询菜单数量
	 * 
	 * @param pid
	 * @return
	 */
	@Override
	public Integer queryMenuByPid(Integer pid) {
		return this.menuDao.queryMenuByPid(pid);
	}

	/**
	 * 删除菜单
	 * 
	 * @param menuVo
	 */
	@Override
	public void deleteMenu(MenuVo menuVo) {
		// 删除菜单表的数据
		this.menuDao.deleteByPrimaryKey(menuVo.getId());
		// 根据菜单id删除sys_role_menu里面的数据
		this.menuDao.deleteRoleMenuByMid(menuVo.getId());

	}
}
