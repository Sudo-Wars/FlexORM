FlexORM is an Object Relational Mapping framework for Adobe AIR. It enables JavaScript/ActionScript3 objects to become persistent objects using the embedded SQLite database; that is, you do not need to write database code or SQL.

The FlexORM framework can be used by either Flex or JavaScript code in AIR applications.

A key feature of FlexORM is its transparency. You do not need to modify your domain objects or inherit from a base class.

For example, given a domain object such as:

[Bindable]
public class Contact
{
 public var id:int;
 public var name:String;
 public var organisation:Organisation;
}

The domain object can be saved and loaded from the local database as follows:

var em:EntityManager = EntityManager.instance;

var contact:Contact = new Contact();
contact.name = 'Steve';
var organisation:Organisation = new Organisation();
organisation.name = 'Apple';
contact.organisation = organisation;

em.save(contact);

var loadedContact:Contact = em.loadItem(Contact, contact.id) as Contact;
var allContacts:ArrayCollection = em.findAll(Contact);


The framework enables you to concentrate on developing rich domain objects, which can be saved across application sessions, without writing error-prone and complex database logic.

Object graphs (objects and their associations) can be saved and restored from the database.

Mapping information to configure columns and relationships can be added using annotations, which also makes the objects self documenting.

For example:

[Bindable]
[Table(name='contacts')]
public class Contact
{
   private var _orders:IList;
   
   [Id]
   [Column(name='contact_id')]
   public var id:int;
   
   public var name:String;
   
   [Transient]
   public var derivedValue:int;

   [ManyToOne(cascade='none')]
   public var organisation:Organisation;
   
   [OneToMany(type='model.Order', indexed='true', lazy='true')]
   public function set orders(value:IList):void
   {
      _orders = value;
   }
   
   public function get orders():IList
   {
      return _orders;
   }
   
   [ManyToMany(type='model.Role')]
   public var roles:IList;

}

[CompositeColumn(name="fullName", expression=":first_name || ' ' || :last_name")]


FlexORM supports the following features:

* Non-intrusive
* Composite Keys
* Save, Update, Delete, Load, and Find All operations
* Automatically creates and updates database schema
* Many-to-one associations
* One-to-many associations
* Many-to-many associations (automatically creates the association table)
* Indexed one-to-many and many-to-many collections
* Bidirectional one-to-many associations
* Cascade saves/updates/deletes
* Transient (non-persistent) properties
* Inheritance mapping
* FK constraints (using triggers in SQLite)
* Automatically creates database indexes
* Transactions
* Automatic Schema Update
* Lazy loading of associations
* Asynchronous API
