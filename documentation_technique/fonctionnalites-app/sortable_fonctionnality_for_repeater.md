tag : #documentation_technique 

## Objectifs
---
Ajouter une fonctionnalité de Drag and Drop au component de Repeater.

## [[Brainstorm]] pour le Drag and Drop
---
- Outils activable sur demande et disponible pour toutes les instances du Repeater
- Détient une forme standardisée qui édite et retourne simplement une valeur "Order" suite à la modification

## [[Conception]] Drag and Drop -> Repeater
---



## Structure
---
version 0.1 - Code intégré dans le fichier Repeater.js
### Dépendances nécessaires pour la fonctionnalité
#
```javascript
//Dépendances spécifiques à l'outil
import {
    DndContext, 
    closestCenter,
    KeyboardSensor,
    PointerSensor,
    useSensor,
    useSensors,
} from '@dnd-kit/core';

import {
    arrayMove,
    SortableContext,
    sortableKeyboardCoordinates,
    verticalListSortingStrategy,
} from '@dnd-kit/sortable';
```
### Premier niveau de component
Contient tous les contextes et références au DND kit. Alors que le "DndContext " s'occupe des fonctionnalitées de Drag and Drop, le SortableContext gère toutes les spécificités liées au triage.

```javascript
//vddsvds
const Repeater = props => {
    //Announce the current dragged element, or null if none
    const [dragActiveItem, setDragActiveItem] = useState(null);
    return (
        <>  
            <section ref={containerRef} className={`${styles["repeater"]}`}>
                <DndContext 
                    sensors={sensors} 
                    collisionDetection={closestCenter} 
                    onDragStart={({ active }) => {
                        setDragActiveItem(active);
                    }}
                    onDragCancel={() => setDragActiveItem(null)}
                    onDragEnd={handleDragEnd}
                >
                    <SortableContext 
                        items={sortedIterationsArray.map(elem => String(elem.key))} 
                        strategy={verticalListSortingStrategy}
                    >
                        {/* REPEATABLE ELEMENT GOES HERE */}
                    </SortableContext>    
               </DndContext>         
            </section>
        </>
    )
}
```

### Fonction qui gère la mise à jour des ordres
Déclenché lorsqu'un élément n'est plus "drag".

```javascript
 /* Manage the reordering when the element is droped */
    function handleDragEnd(event) {
        
        const {active, over} = event;

        if (active?.id && over?.id && active.id !== over.id) {
            const sortedKeysArray = sortedIterationsArray.map(elem => String(elem.key))
            //Initial array of orders (supposed to be sorted). Ex : [1, 2, 3, 4]
            const arrayOfActualOrders = sortedIterationsArray.map(elem => elem.order)
            //Array of modified orders. Ex : [1, 4, 2, 3] 
            const modifiedOrders = arrayMove(arrayOfActualOrders, sortedKeysArray.indexOf(active.id), sortedKeysArray.indexOf(over.id));
            //New state object to edit and then, update
            let newIterationState = {...iterations}
            //Create a keys array
            const iterationsKeys = Object.keys(iterations)
            //Loop through the iterations state object with the keys
            iterationsKeys.forEach(key => {
                //Get the new correct calculated order by index refering
                //For this to work, we assume that the index are in order
                const oldOrder = newIterationState[key].order;
                //Find the new order of the element by its index in the array and modify the value
                newIterationState[key].order = modifiedOrders.indexOf(oldOrder);
            })
            //Update the state with the new modified object
            setIterations(newIterationState)
        }   
        setDragActiveItem(null);
    }
```
### Component de l'item trié
Créé une référence de DOM nécessaire pour le Drag and Drop. Contient également le bouton (Drag) qui permet à l'utilisateur de déplacer un élément.

```javascript
const SortableItem = props => {
    const {
        isDragActive,
        sortable,
        //Autres props...
    } = props;

    const {
        attributes,
        listeners,
        setNodeRef,
        transform,
        transition,
      } = useSortable({ id: props.id });

    const style = {
        transform: CSS.Transform.toString(transform),
        transition,
    };
      
    return (
        <article 
            style={style}
            id={iteration.key}
            ref={setNodeRef}
            className={`d-flex flex-nowrap rounded my-2 ${styles["repeatable"]} ${className} ${isDragActive && "shadow"}`}
            draggable={true}
            data-order={iteration.order}
        >
            { sortable && sortedIterationsArray.length > 1 && 
                <div 
                    {...attributes} 
                    {...listeners}
                    draggable={true}
                    type="button" 
                    className={`${styles["dragging-button"]} rounded-start flex-grow-0 d-flex align-items-center p-2`}
                >
                    <Icon className="d-flex align-items-center" iconName='las la-grip-vertical'/>
                </div>
            }
            <div className="container">
                <div className="row">
                    <RepeaterSingleIteration 
                        iterationKey={iteration.key}
                        deleteIterationByKey={() => deleteIterationByKey(iteration.key)}
                        formInitSubStructure={iteration.initFormStructureWithValues ? iteration.initFormStructureWithValues : formInitStructure}
                        updateIterationValue={updateIterationValue}
                    >
                        {children}
                    </RepeaterSingleIteration>
                </div>
            </div>
        </article>
    )
}
```
